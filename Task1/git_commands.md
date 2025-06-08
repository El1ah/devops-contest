
### 1. Ініціалізація репозиторію
```bash
mkdir devops-contest
cd devops-contest
mkdir Task1
git init
```

### 2. Створення README.md
```bash
vim Task1/README.md
# (Написали щось і зберегли)
```
### 3. Додавання та початковий коміт
```bash
git add .
git commit -m "init commit"
```
### 4. Підключення до GitHub та пуш
```bash
git remote add origin https://github.com/El1ah/devops-contest.git
# (використано PAT токен замість паролю)
git push -u origin master
```
### 5. Створення гілки dev та додавання тестового файлу
```bash
git checkout -b dev
echo "hello world" > Task1/test.txt
git add .
git commit -m "Added test file to dev branch"
git push origin dev
```
### 6. Створення нової фічі в гілці
```bash
git checkout -b El1ah-new_feature
echo "# Feature in progress" >> Task1/README.md
git add .
git commit -m "Added readme to new feature branch"
git push origin El1ah-new_feature
```
### 7. Додавання .gitignore
```bash
echo ".*" > .gitignore
git add .gitignore
git commit -m "Added gitignore file"
git push origin El1ah-new_feature
```
### 8. Скасування останнього коміту
```bash
git checkout El1ah-new_feature
echo "Update for log test" >> README.md
git add README.md
git commit -m "Edit README.md for testing reset"
git reset --soft HEAD~1
```
### 9. Збереження логів у файл
```bash
git log > log.txt
```
### 10. Додавання лог-файлу до main
```bash
git checkout main
git add log.txt
git commit -m "Add git log to log.txt"
git push origin main
```
### 11. Видалення гілки El1ah-new_feature
```bash
git branch -d El1ah-new_feature
git push origin --delete El1ah-new_feature
```
### 12. Додавання файлу git_commands.md до dev
```bash
git checkout dev
vim git_commands.md
git add git_commands.md
git commit -m "*comment*"
git push origin dev
```
