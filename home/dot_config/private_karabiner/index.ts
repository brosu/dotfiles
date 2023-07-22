import {
  ifApp,
  ifVar,
  layer,
  map,
  mapDoubleTap,
  NumberKeyValue,
  rule,
  simlayer,
  withCondition,
  withMapper,
  writeToProfile,
  toKey,
  ToEvent,
  duoLayer,
  KeyAlias,
  LetterKeyCode,
  mapSimultaneous,
  ModifierKeyAlias,
  modifierKeyAliases,
  MultiModifierAlias,
  multiModifierAliases,
  toRemoveNotificationMessage,
} from "https://deno.land/x/karabinerts@1.23.0/deno.ts";

type Key = LetterKeyCode | KeyAlias;
type Mod = "command" | "control" | "option" | "shift";

export function duoModifier(
  keys: `${Key}${Key}`,
  modifier: "⌘" | "⌥" | "⌃" | "⇧" | MultiModifierAlias
) {
  const id = keys + modifier;

  const parsedModifiers =
    modifier in modifierKeyAliases
      ? ([modifierKeyAliases[modifier as ModifierKeyAlias]] as Mod[])
      : (multiModifierAliases[modifier as MultiModifierAlias] as Mod[]);
  const to_after_key_up = [toRemoveNotificationMessage(id)];
  return mapSimultaneous(keys.split("") as Key[], { to_after_key_up })
    .toNotificationMessage(id, modifier) // Must go first or to() doesn't work
    .to(`left_${parsedModifiers[0]}`, parsedModifiers.slice(1));
}

export const arrowMode = {
  h: toKey("←"),
  j: toKey("↓"),
  k: toKey("↑"),
  l: toKey("→"),

  n: toKey("←", "⌘"),
  m: toKey("↓", "⌘"),
  ",": toKey("↑", "⌘"),
  ".": toKey("→", "⌘"),

  y: toKey("←", "⌃"),
  u: toKey("↓", "⌃"),
  i: toKey("↑", "⌃"),
  o: toKey("→", "⌃"),

  6: toKey("←", "⌥"),
  7: toKey("↓", "⌥"),
  8: toKey("↑", "⌥"),
  9: toKey("→", "⌥"),
};

const withShift = (e: ToEvent) => ({
  ...e,
  modifiers: [...(e.modifiers || []), "shift"],
});
export const arrowShift = Object.entries(arrowMode).reduce(
  (r, [k, v]) => ({ ...r, [k]: withShift(v) }),
  {}
);

export const deleteMode = {
  j: toKey("⌫"),
  k: toKey("⌦"),

  m: toKey("⌫", "⌘"),
  ",": toKey("⌦", "⌘"),

  u: toKey("⌫", "⌥"),
  i: toKey("⌦", "⌥"),

  7: toKey("⌫", "⌃"),
  8: toKey("⌦", "⌃"),
};

const duoMods = rule("duo-modifiers").manipulators([
  // ‹⌘⌥⌃ == dsa + f
  duoModifier("fd", "⌘"),
  duoModifier("fs", "⌥"),
  duoModifier("fa", "⌃"),

  duoModifier("ds", "⇧"),

  // ‹⌘⌥⌃ + ⇧ == dsa + g
  duoModifier("gd", "⌘⇧"),
  duoModifier("gs", "⌥⇧"),
  duoModifier("ga", "⌃⇧"),

  duoModifier("vc", "⌘⌥"),
  duoModifier("vx", "⌘⌃"),
  duoModifier("cx", "⌥⌃"),

  duoModifier("vz", "⌘⌥⌃"),

  // ›⌘⌥⌃ == kl; + j
  duoModifier("jk", "⌘"),
  duoModifier("jl", "⌥"),
  duoModifier("j;", "⌃"),

  duoModifier("kl", "⇧"),

  // ›⌘⌥⌃ + ⇧ == kl; + h
  duoModifier("hk", "⌘⇧"),
  duoModifier("hl", "⌥⇧"),
  duoModifier("h;", "⌃⇧"),

  duoModifier("m,", "⌘⌥"),
  duoModifier("m.", "⌘⌃"),
  duoModifier(",.", "⌥⌃"),

  duoModifier("m/", "⌘⌥⌃"),
]);

const rules = [
  duoMods,
  layer("/", "symbol-mode").manipulators([
    //     / + [ 1    2    3    4    5 ] =>
    withMapper(["⌘", "⌥", "⌃", "⇧", "⇪"])((k, i) =>
      map((i + 1) as NumberKeyValue).toPaste(k)
    ),
    withMapper(["←", "→", "↑", "↓", "␣", "⏎", "⇥", "⎋", "⌫", "⌦", "⇪"])((k) =>
      map(k).toPaste(k)
    ),
  ]),
  // map("⇪",'Any','optionalAny').toPaste("⎋"),
  // map("⇪").toIfAlone(toKey("⎋")),
  // map("⇪").toKey("⎋"),
  duoLayer("f", ";").manipulators(arrowMode).notification("Arrow ← → ↑ ↓"),
  layer("⇪")
    .manipulators(arrowMode)
    .configKey((v) => v.toIfAlone("⎋"), true),
];

// console.log(rules)

writeToProfile("kts", rules, {
  //   "basic.simultaneous_threshold_milliseconds": 50,
  //   "duo_layer.threshold_milliseconds": 200,
  //   "duo_layer.notification": true,
});
