<%!
def indent(t):
    return t.replace("\n", "\n            ")
    %>
/root/.ssh/id_rsa.deploy:
    file:
        - managed
        - contents: |
            ${pillar['deploy-user-secret'][pillar['hosts'][grains['id']]['env']] | indent }
        - mode: 600
        - order: 9
/root/.ssh/config:
    file:
        - managed
        - contents: |
                Host           *
                IdentityFile   ~/.ssh/id_rsa.deploy
                User           deploy
        - mode: 600
        - order: 9
