FROM --platform=linux/amd64 br/dotfiles_test:latest

ADD . /root/.local/share/chezmoi
RUN /root/.local/share/chezmoi/install
ENTRYPOINT chezmoi data && chezmoi apply


# RUN git config --global credential.helper store
# RUN echo "https://brosu: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@github.com" > ~/.git-credentials
# git clone git@github.com/brosu/init.git
# RUN mkdir -p /app && cd /app && git clone https://brosu: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@github.com/brosu/init.git