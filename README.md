# pre-commit-hooks

**Хуки**

- `go-fmt` - запускает `go fmt` на измененные файлы
- `go-gofumpt` - запускает `go gofumpt` на измененные файлы
- `go-static-check` - запускает `staticcheck` на измененные файлы
- `go-imports` - запускает `goimports` на измененные файлы

```yaml
  - id: go-imports
    args: [ -local=gitlab.ru/moicode ] # optional
```

- `golangci-lint` - запускает golangci-lint на измененные файлы

```yaml
  - id: golangci-lint
    args: [ --config=.golangci.pipeline.yaml ] # optional
```

## Предварительные требования

Для корректной работы хуков требуется установить в систему
- [pre-commit](https://pre-commit.com)
- [gofumpt](https://github.com/mvdan/gofumpt)

```shell
  brew install pre-commit
  go install mvdan.cc/gofumpt@latest
```

## Настройка проекта

Для работы хуков необходимо создать в корне проекта файл `.pre-commit-config.yaml`.

Пример файла можно взять в файле [examples/.pre-commit-config.yaml](./examples/.pre-commit-config.yaml).

Либо добавить в существующий файл следующий конфиг:

```yaml
repos:
  # ...
  - repo: https://github.com/Worldbug/go-pre-commit-hooks
    rev: v1.1.0
    hooks:
      - id: go-imports
      - id: go-gofumpt
      - id: golangci-lint
        args: [ --config=.golangci.pipeline.yaml ] # optional
```

- В корне проекта выполнить команду:

```shell
  pre-commit install -f
```

## Ручной запуск хуков

Для ручного запуска хуков выполните команду в корне проекта:

```shell
  pre-commit run --all-files
```

## Обновление

Для обновления версии хуков выполните в корне проекта команду:

```shell
  pre-commit autoupdate
```
