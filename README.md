# k3s-tools

Набор утилит для подготовки и обслуживания нод в кластере [k3s](https://k3s.io/).

## 📌 Скрипт: prepare-k3s-node.sh

Скрипт подготавливает новую или переустановленную ноду для подключения к кластеру:

- переводит систему в **UTC**;
- очищает старые артефакты `k3s` (сертификаты, конфиги);
- создаёт `/etc/rancher/k3s/config.yaml` с правильным `node-name` и `node-ip`.

### ⚙️ Установка и запуск

```bash
curl -sL https://raw.githubusercontent.com/iflixer/k3s-tools/main/prepare-k3s-node.sh | bash
```

```bash
curl -sL https://raw.githubusercontent.com/iflixer/k3s-tools/main/install_utils | bash
```
### ВАЖНО

если несколько внешних IP - надо указать в файле вручную иначе возьмет первый попавшийся
