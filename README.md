# lancers-links

Redirect pages for Lancers recruitment (GitHub Pages, meta-refresh method).

Lancers job URLs are only known after publication, and task-type job
descriptions cannot be edited afterwards. These stable redirect URLs are
written into the job descriptions in advance; the redirect targets are
updated after the jobs are published.

## Link ledger

| Path | Purpose | Target (Lancers job) | Status |
|---|---|---|---|
| `/go/s1-female/` | Study Set 1, female version | (placeholder) | pre-launch |
| `/go/s1-male/`   | Study Set 1, male version   | (placeholder) | pre-launch |

Public URLs (write these in the Lancers job descriptions):

```
https://YOUR_USERNAME.github.io/lancers-links/go/s1-female/
https://YOUR_USERNAME.github.io/lancers-links/go/s1-male/
```

## Updating a redirect target

Always regenerate via the script (never hand-edit the HTML — the target
URL appears in three places and must stay in sync):

```bash
./make_redirect.sh go/s1-female "https://www.lancers.jp/work/detail/XXXXXXX" "女性用"
./make_redirect.sh go/s1-male   "https://www.lancers.jp/work/detail/YYYYYYY" "男性用"
git add . && git commit -m "Point s1 redirects to published Lancers jobs" && git push
```

GitHub Pages redeploys in ~1-2 minutes. Verify by opening the /go/ URLs
in a private browsing window.

## Adding links for future study sets

```bash
./make_redirect.sh go/s2-female "TARGET_URL" "女性用"
```

Then add a row to the ledger table above.
