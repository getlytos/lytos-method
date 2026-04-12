# Skill — Deployment

*This skill defines how to prepare, execute, and validate a deployment. An agent loaded with this skill knows what to check before deploying, how to do it, and how to confirm everything works.*

---

## When to invoke this skill

- Before each production release
- When setting up a CI/CD pipeline
- After a critical fix that needs to ship quickly
- To document the deployment procedure for a new project

---

## Procedure

### 1. Pre-deployment — Checklist

Before any deployment, verify each point:

#### Code

- [ ] All tests pass (unit + E2E)
- [ ] The branch is up to date with the main branch
- [ ] No merge conflicts
- [ ] No forgotten `TODO` or temporary code
- [ ] No hardcoded secrets (API keys, passwords, tokens)

#### Dependencies

- [ ] Dependencies are locked (lock file up to date)
- [ ] No dependency added without justification in the issue
- [ ] Production versions are consistent with development

#### Configuration

- [ ] Production environment variables are set
- [ ] URLs, ports, and paths point to production (not dev)
- [ ] Database migrations are ready and reversible

#### Review

- [ ] The PR has been reviewed (code-review skill)
- [ ] The issue's done criteria are met
- [ ] The human has approved the deployment

### 2. Deployment — Execution

The deployment follows the pipeline defined by the project. Common formats:

#### Via CI/CD (recommended)

```bash
# Merging to the production branch triggers the pipeline
git checkout main
git merge --no-ff feat/ISS-XXXX-slug
git push origin main
# -> CI/CD takes over (build, test, deploy)
```

#### Via manual command

```bash
# 1. Build
npm run build          # or python -m build, cargo build --release, etc.

# 2. Production test
npm run test:prod      # tests on the production build

# 3. Deploy
npm run deploy         # or rsync, scp, docker push, kubectl apply, etc.
```

#### Rollback — always plan for it

Before deploying, make sure a rollback is possible:

```bash
# Identify the current version in production
git log --oneline -1 origin/production

# In case of a problem
git revert HEAD
git push origin main
# or: redeploy the previous tag
```

### 3. Post-deployment — Validation

After deployment, verify everything works:

- [ ] The application responds (health check, home page)
- [ ] Critical features work (manual test or automated smoke test)
- [ ] Logs show no errors
- [ ] Metrics are normal (response time, error rate)
- [ ] Database migrations were applied correctly

### 4. Documentation

After a successful deployment:

- Update the issue (status -> `5-done`)
- Update the BOARD.md
- If a problem was encountered and resolved -> add it to `cortex/bugs.md`
- If a deployment procedure changed -> update this skill or the project notes

---

## Deployment strategies

| Strategy | When to use | Risk |
|----------|------------|------|
| **Direct** (push to prod) | Small projects, solo team | High — no safety net |
| **Blue-green** | Critical applications | Low — instant rollback |
| **Canary** | Many users | Low — progressive exposure |
| **Feature flags** | Risky features | Low — enable/disable without redeploying |

For most projects using Le Socle, the **CI/CD with merge to main** strategy is sufficient.

---

## Environments

| Environment | Usage | Who deploys |
|-------------|-------|-------------|
| `local` | Development | The agent or developer |
| `staging` | Pre-production testing | CI/CD automatic on merge to `dev` or `staging` |
| `production` | End users | CI/CD automatic on merge to `main` (after human validation) |

---

## Final checklist

- [ ] Pre-deployment verified (code, dependencies, config, review)
- [ ] Rollback prepared
- [ ] Deployment executed
- [ ] Post-deployment validated (health check, features, logs)
- [ ] Issue and BOARD.md updated
- [ ] Memory enriched if learning occurred

---

*This skill is immediately operational. An agent that loads it can prepare and validate a deployment without further interpretation.*
