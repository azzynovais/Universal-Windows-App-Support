# 🔒 Política de Segurança

## Relatar uma Vulnerabilidade

Se você descobrir uma falha de segurança, **NÃO abra uma issue pública**!

### ✅ Procedimento Correto

1. **Envie email privado para o maintainer**
   - Assunto: `[SECURITY] Vulnerabilidade encontrada`
   - Inclua descrição detalhada
   - Inclua passos para reproduzir
   - Inclua possível solução (opcional)

2. **Aguarde resposta em até 48 horas**

3. **Coordene lançamento de patch**
   - Deixe tempo para correção (7-14 dias)
   - Divulgaremos segurança do patch
   - Você será creditado (se desejar)

### ❌ O Que NÃO Fazer

- ❌ Compartilhar publicamente antes da correção
- ❌ Exigir recompensa/resgate
- ❌ Abrir issue no GitHub
- ❌ Postar em redes sociais

---

## Aspectos de Segurança do Projeto

### Considerações de Segurança

Este projeto executa scripts bash e instala pacotes de sistema. Pontos importantes:

#### 1. Validação de Entrada

```bash
# ✅ Bom: Valida entrada
if [[ "$USER_INPUT" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Válido"
fi

# ❌ Ruim: Sem validação
rm -rf "$user_path"  # Perigoso!
```

#### 2. Quotes em Variáveis

```bash
# ✅ Sempre use quotes
echo "$variavel"

# ❌ Nunca deixe sem quotes
echo $variavel  # Vulnerable a word splitting
```

#### 3. Permissões

```bash
# ✅ Mínimo necessário
chmod 755 script.sh  # Executável, sem escrita para outros

# ❌ Cuidado com 777
chmod 777 arquivo  # Qualquer um pode modificar!
```

#### 4. Download Seguro

```bash
# ✅ Verificar hash
curl URL -o script.sh
sha256sum -c CHECKSUM
bash script.sh

# ❌ Evitar pipe direto em bash
curl URL | bash  # Risco se URL for interceptada
```

---

## Dependências e Vulnerabilidades

### Monitoramento

- Dependências são monitoradas
- GitHub Dependabot ativa
- Atualizações de segurança prioritárias

### Pacotes Críticos

| Pacote | Versão Min | Razão |
|--------|------------|-------|
| Wine | 7.0+ | Correções de segurança |
| Flatpak | 1.10+ | Sandbox seguro |
| Bash | 4.0+ | Features segurança |

---

## Práticas Seguras

### Para Usuários

1. **Download seguro**
   ```bash
   # Verificar hash
   sha256sum windows-app-support.sh
   # Compare com GitHub Release
   ```

2. **Revisar script antes de executar**
   ```bash
   less windows-app-support.sh
   # Procure por comandos suspeitos
   ```

3. **Usar sudo com cuidado**
   ```bash
   sudo -u $USER bash script.sh
   # Limita o que o script pode fazer
   ```

4. **Manter atualizado**
   ```bash
   # Verifique novas versões regularmente
   ```

### Para Desenvolvedores

1. **Code Review**
   - Toda mudança é revisada
   - Mínimo 1 aprovação antes de merge

2. **Testes**
   - Testes em múltiplas distros
   - Testes de regressão

3. **Commits Signed**
   - Commits assinados com GPG
   ```bash
   git commit -S -m "Mensagem"
   ```

4. **Branches Protegidas**
   - main branch requer review
   - CI/CD deve passar

---

## Checklist de Segurança

Para todo PR:

- [ ] Sem shell injection
- [ ] Sem uso inseguro de `eval`
- [ ] Variáveis sempre quoted
- [ ] Sem hardcoded passwords
- [ ] Sem dependências inseguras
- [ ] Sem permissões excessivas
- [ ] Testado em múltiplas ambientes
- [ ] Sem warnings de lint
- [ ] Comentários sobre segurança

---

## Vulnerabilidades Conhecidas

### v2.0.0
- Nenhuma conhecida no momento

### Histórico
- (Nenhuma divulgação anterior)

---

## Recursos de Segurança

### Ferramentas Recomendadas

- `shellcheck` - Lint para bash
- `shfmt` - Formatter para bash
- `git-crypt` - Encrypt sensível data
- `GPG` - Assinar commits

### Leitura Recomendada

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Bash Security Best Practices](https://mywiki.wooledge.org/BashGuide)
- [Linux Foundation Security](https://www.linuxfoundation.org/security/)

---

## Incidentes de Segurança Passados

Nenhum incidente reportado até a data.

---

## Contato de Segurança

Para questões de segurança:

- Email: [Contato do maintainer - veja README.md]
- GitHub: Abra [Private Vulnerability Report](https://github.com/azzynovais/Universal-Windows-App-Support/security/advisories)

### Tempo de Resposta

- Crítico: < 24 horas
- Alto: < 72 horas
- Médio: < 1 semana
- Baixo: < 2 semanas

---

## Divulgação Responsável

Seguimos responsável/coordinated disclosure:

1. **Relato privado** da vulnerabilidade
2. **Resposta confirmando recebimento** (24-48h)
3. **Investigação e correção** (7-14 dias)
4. **Notificação pública e patch** (divulgação simultânea)
5. **Crédito público** ao pesquisador (se desejar)

---

## Perguntas Frequentes de Segurança

**P: É seguro executar scripts baixados da internet?**
A: Não automaticamente. Sempre:
1. Revise o código
2. Verifique a fonte
3. Use ferramentas de scan
4. Execute em sandbox se possível

**P: Como verificar se o script foi modificado?**
```bash
# Baixar hash do GitHub Release
# Comparar
sha256sum -c arquivo.sha256
```

**P: Consigo usar em produção?**
A: Com cuidado:
1. Teste em staging primeiro
2. Revise alterações propostas
3. Mantenha backups
4. Monitore logs

**P: Que permissões o script precisa?**
A: `sudo` é necessário para:
- Instalar pacotes (apt/dnf/pacman/zypper)
- Criar systemd services (se aplicável)

Tudo mais é executado como usuário normal.

**P: Wine/Bottles são seguros?**
A: Wine executa Windows binaries em isolamento relativo
- Bottles oferece melhor isolamento (sandbox Flatpak)
- Recomendado para aplicativos não-confiáveis

---

## Atualizações de Segurança

### Frequência

- Patches críticos: ASAP (< 24h)
- Patches altos: 72 horas
- Outras updates: Release regular

### Notificação

- GitHub Releases
- Changelog
- Email (após signup)

---

## Licença de Segurança

Este projeto é licenciado sob GPLv2.

Mudanças de segurança serão sempre:
- ✅ Open source
- ✅ Transparentes
- ✅ Crédito público
- ✅ Divulgação responsável

---

**Segurança é responsabilidade de todos.** 🔒

*Última atualização: 9 de janeiro de 2026*

---

## Apêndice: Auditoria de Segurança

### Tools de Análise Estática

```bash
# ShellCheck
shellcheck windows-app-support.sh

# OSINT
grep -n "API_KEY\|PASSWORD\|SECRET" *

# Verificar permissões
find . -type f -perm -u=x,g=x,o=x -ls
```

### Testes Manuais

```bash
# Executar em VM com monitor
# Verificar chamadas de sistema
strace ./windows-app-support.sh

# Verificar conexões de rede
tcpdump -i any 'tcp port 443 or tcp port 80'
```

---

**Relatos de Segurança são valorizados e considerados com seriedade.** 🙏
