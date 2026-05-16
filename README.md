# docker-racktables

A simple Docker Compose setup to self-host RackTables by building the image locally.

## Usage

### ⚠️ Note: Default passwords are set to root and pass. Change them for production use.

1. Start Containers

```bash
docker compose up -d --build
```

Access `http://<SERVER_IP>:8080/`


<details>
<summary>2. UI Installation Steps</summary>


<img width="711" height="154" alt="Screenshot 2026-05-16 at 17 44 21" src="https://github.com/user-attachments/assets/e5c6c005-ebee-4e2d-8ad2-14e7e29b3d73" />

-> Click "here"

---

<img width="569" height="140" alt="Screenshot 2026-05-16 at 17 44 39" src="https://github.com/user-attachments/assets/bd50611e-508b-4d12-a5cb-e2033138999f" />

-> Click "proceed"

---

<img width="791" height="602" alt="Screenshot 2026-05-16 at 17 46 11" src="https://github.com/user-attachments/assets/a2e90dbd-1c7e-4410-b727-cc7572020b8a" />

-> Click "proceed"

---

<img width="1387" height="215" alt="Screenshot 2026-05-16 at 17 46 57" src="https://github.com/user-attachments/assets/094bb2a9-75e1-4038-8ec8-6fe6229db8ef" />

-> secret.php is not writable. 

So run these and click "retry"
```
docker compose exec racktables-web touch /var/www/html/wwwroot/inc/secret.php
docker compose exec racktables-web chown www-data:www-data /var/www/html/wwwroot/inc/secret.php
docker compose exec racktables-web chmod 666 /var/www/html/wwwroot/inc/secret.php
```

---

<img width="1310" height="453" alt="Screenshot 2026-05-16 at 17 47 58" src="https://github.com/user-attachments/assets/74c4369c-5373-4fc1-a082-a98e323aa642" />

-> Fill "TCP host", "database", "password" as you specify in docker-compose.yaml

<img width="1235" height="485" alt="image" src="https://github.com/user-attachments/assets/cb61f7b2-1713-4f3e-a0d5-96cbadbcd029" />

-> Click "retry"

<img width="596" height="171" alt="Screenshot 2026-05-16 at 17 49 00" src="https://github.com/user-attachments/assets/c87c5226-2eef-47ff-bee2-1c4aed6d13cd" />

---

<img width="1499" height="314" alt="image" src="https://github.com/user-attachments/assets/696294bd-2ff1-4b5c-9285-aacd5c41c829" />

-> After configuration db, you should make secret.php read-only

```
docker compose exec racktables-web chmod 440 /var/www/html/wwwroot/inc/secret.php
```

-> Then click "retry"


<img width="552" height="148" alt="Screenshot 2026-05-16 at 17 50 06" src="https://github.com/user-attachments/assets/cb25d0f3-53c1-47f8-90b9-ce5884cd8fb8" />

-> Click "proceed"

---

<img width="566" height="275" alt="Screenshot 2026-05-16 at 17 50 17" src="https://github.com/user-attachments/assets/ef199b9d-4c65-43eb-8664-04b6efe4487e" />

-> Click "proceed"

---

<img width="539" height="212" alt="Screenshot 2026-05-16 at 17 51 05" src="https://github.com/user-attachments/assets/f51a7056-64df-4b57-9167-77d275bb9c87" />

-> Set admin password and click "retry"

<img width="547" height="153" alt="Screenshot 2026-05-16 at 17 51 12" src="https://github.com/user-attachments/assets/3b9dbe34-95db-43dc-9256-54d8e67ed87b" />

-> Click "proceed"

---

<img width="948" height="174" alt="Screenshot 2026-05-16 at 17 51 30" src="https://github.com/user-attachments/assets/d39f9ac4-c127-4549-9907-3a10db20e190" />

-> Click "proceed"

<img width="1720" height="1039" alt="Screenshot 2026-05-16 at 17 53 12" src="https://github.com/user-attachments/assets/a15e39d0-d3f3-4a7b-9a55-ffb59521ef24" />

-> Done

</details>
