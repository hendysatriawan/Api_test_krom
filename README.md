# API_Test_Krom

API Testing project for Petstore API using Postman & Newman.

---

## Tech Stack

| Tool | Version |
|------|---------|
| Postman | latest |
| Newman | latest |
| newman-reporter-htmlextra | latest |

---

## Prerequisites

- Node.js
- Newman
- Newman HTMLExtra Reporter

---

## Installation

### 1. Clone project
```bash
git clone https://github.com/hendysatriawan/Api_test_krom.git
cd Api_test_krom
```

### 2. Install Newman
```bash
npm install -g newman
```

### 3. Install HTMLExtra Reporter
```bash
npm install -g newman-reporter-htmlextra
```

---

## Project Structure

```
API_Test_Krom/
├── Postman/
│   ├── Pet.postman_collection.json       # Collection untuk Pet endpoint
│   ├── User.postman_collection.json      # Collection untuk User endpoint
│   ├── store.postman_collection.json     # Collection untuk Store endpoint
│   └── test_Env.postman_environment.json # Environment variables
├── BDD/
│   ├── pet.feature                       # BDD scenario Pet
│   ├── user.feature                      # BDD scenario User
│   └── store.feature                     # BDD scenario Store
├── report/
│   ├── pet-report.html                   # Report Pet test
│   ├── user-report.html                  # Report User test
│   └── store-report.html                 # Report Store test
├── newman_run.sh                         # Script untuk run semua collection
└── README.md
```

---

## API Under Test

**Petstore Swagger API** → https://petstore.swagger.io/

| Collection | Endpoint |
|------------|----------|
| Pet | `/pet` |
| User | `/user` |
| Store | `/store` |

---

## Running Tests

### Run semua collection sekaligus
```bash
sh newman_run.sh
```

### Run per collection manual
```bash
# Pet
newman run Postman/Pet.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/pet-report.html \
  --reporter-htmlextra-title "Pet API Test Report" \
  --reporter-htmlextra-darkTheme

# User
newman run Postman/User.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/user-report.html \
  --reporter-htmlextra-title "User API Test Report" \
  --reporter-htmlextra-darkTheme

# Store
newman run Postman/store.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/store-report.html \
  --reporter-htmlextra-title "Store API Test Report" \
  --reporter-htmlextra-darkTheme
```

---

## View Existing Reports

Hasil report sudah tersedia di folder `report/`. Buka langsung di browser tanpa perlu running ulang:

| File | Description |
|------|-------------|
| `report/pet-report.html` | Report hasil test Pet endpoint |
| `report/user-report.html` | Report hasil test User endpoint |
| `report/store-report.html` | Report hasil test Store endpoint |

---

## BDD Scenarios

Test scenarios ditulis dalam format Gherkin BDD tersedia di folder `BDD/`:

| File | Description |
|------|-------------|
| `pet.feature` | Scenario untuk Pet endpoint |
| `user.feature` | Scenario untuk User endpoint |
| `store.feature` | Scenario untuk Store endpoint |