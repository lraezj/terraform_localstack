# REBASE.md

## Objetivo
Editar el historial reciente de commits para mejorar la claridad de los mensajes y eliminar commits redundantes.

## Pasos realizados

1. Ejecuté `git log --oneline` para contar cuántos commits recientes debía editar.
2. Usé el comando `git rebase -i HEAD~5` (modificar el número según la cantidad de commits).
3. En el editor interactivo:
   - Cambié `pick` por `reword` en los commits cuyos mensajes eran poco claros.
   - Cambié `pick` por `squash` en los commits redundantes o relacionados.
   - Guardé y reescribí los mensajes donde fue necesario.
4. Después de completar el rebase, ejecuté `git push --force` para actualizar el historial remoto con los cambios reescritos.

## Resultado
El historial del repositorio ahora contiene commits más limpios, descriptivos y coherentes.
