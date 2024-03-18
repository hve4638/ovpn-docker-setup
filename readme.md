# openvpn-docker-setup

docker 이미지 [alekslitvinenk/openvpn](https://hub.docker.com/r/alekslitvinenk/openvpn)를 이용하는 setup 방법

**Purpose**


**Requirements**

- `git`, `make` 패키지
- (선택) `curl` 패키지

```bash
apt install make
apt install curl
```

## Usage

```bash
git clone https://github.com/hve4638/ovpn-docker-setup.git
```

```bash
vim openvpnenv.sh
```

```bash
. openvpnenv.sh
```

```bash
make up
```

*WIP*