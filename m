Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170460;
	b=JtLAHStHU6fpHDmBNhRxlf3BsOd+Kb/i38sVXfDi6ZPlKTKAemxuQFhsPyfg2mC2mtoT
	 PjG6p8/6zaWzh3ACkHazQo/auWAz4DVmaKL2jterl9WqFFSNPKPo2jbnUvMJV3lHwjPjX
	 LgOFG4zLhK19X3dVNYzLOB90+wQ+eyDWhZUH2i67Ch0qxyuejLUs5LPZk4KVlfj//UZr8
	 L3X6+pTUkJoqfLTAzFIYt0MC+pFCqsXITURXBLbGWZwdaGQRTGtrLrrDWT53xyvV8cb6V
	 R/+yA731aDzS1qVZ2ohrYGOiUvkn3rh/uooJ7CRrOZPDzN3gs3IeNaKyMfbVpuU6HGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
	b=IVejT2wzlKORbUju2zi5NJielCptVdi6Lg+PYp116otClT4unOqL/MsJ3ZGoFvFSd5ZH
	 mvH5b/zf7izNIVO2A4ebLCkuxpIVKBlWHzMCki8XGK3MCVbAMX5At0qU1fIQo8susHO0/
	 wub5EDFPsgeSht8mszK3+gj1rZ0bIYt3ql/VtrdrI5Mbhsgs5ytjl65dheOyzz+BewZh4
	 4w7JS71wCdEWWCmlV88mcpPOQ0OC2hZbQ1pPnDVGBlqkNCSCCZoCAqyFpVwedgX0qbgt1
	 raqL5yCWM9oKB9mGnxR5zJVVmg7/C/VPQeVU3O4ADjTeOwwFghkUfpR8Wj2FuXBGGJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmYYY60E;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47262606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 20:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47262606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmYYY60E
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso60528b3a.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 12:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170460; x=1794775260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
        b=MmYYY60E7BCg3MiLWXr7/JvLLcCqdNswRYahd6AEa47+ItVcVLh7GlXcPLvoqoNo1f
         QLVbOoc0x2xMUWpDNwlU9keLfJt9cmA9Uz3nm3FbySIMkH6uVkJJ0ZOfRorIEsnrCJJ2
         F+9d/Ga5XyAghZ2RUYFiOILgPMXQVbx4CFZbgL69NIjXmtBR5QCUVA9YXGo4vCsKe1PD
         wnam+cTWMS+YYeRtsBwfPEM6qm+75PujoS7IdlTLdz1MVYU2sa7mndAQNtfcPTo3UWRf
         5MXHZE8gcfvZAs1F4jtsDkv2QLGepW08QCd57NaDi6XK2QwSjEqA5GZtXhDmVOKiRK/j
         DzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170460; x=1794775260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
        b=2fRO1GEOEGdeOSaKzUZV26MpX4pCSxDOWkOzkGUmmmm7R+J6GtW9c1X7oyg+FSL5u3
         HkAt6+Ky/saldRi+nW1Z3NgvrPJ5GAfynJcLxe5p3fCPNz+XDIRBB3kvT1YabWDRHalN
         26slRZAq8JJBn26dEkwjvMffesLfwdyFqVyTsQ5QgIicl2VATg6KzRhjsQrW3yyvv8dC
         K3wswitCApwx+EIg1gHhU7eYMtw5Fj8fH+j/yidN8XJVQqxB8N0LVPWHZRqhnOdv5RTA
         cqDHTPmgzpzq6l8muXBVJe4UzUhRSH6CLwbkWHP832PkiztO5RQemXoFGjXH68jTAeuP
         1ZUg==
X-Gm-Message-State: APuU4Z9Azr2bbvtAyRVwqiK1zI5QAagcN3X5wxq2ihwDNp5TvgrTC/lL
	a1hPc6ltne6iYYsDP2T6n19igk8orew5J2WCkZDimp6ygEhjhR9k7QwIQvRAmg==
X-Gm-Gg: AYBFou0/hi8ByLz648WU83JgkJftm5VverIkO9KcgkPxFuJJ1Z1OW0/MUV4zkL/J5IF
	UsDIDPxO5mTWRM+thO2U9liKFlvQMazHHy853y/u5ft+uZ4TJpcQEzz4qEnGR0bvR9qdHMHjZyt
	AgDRV/5cVengBzedJcCzBCKUOEzxBE2XLM4jrsjR1FMQKaCt5M54197hXKlH2AH3Eh8cembMtTk
	t6qYU6sz/y+VK4mB/FJLZOmUbVUNGWxfltEpkVSja6EegqY+G7GChRfcODdrie5ArORmGzSaWXU
	bhetVRvRaZkfcLwwOvHk2l/QkhXAK0wV68Hs3xetZ70RjRjMKT4rV8V6Gud6ocFFFFsuENHcB6L
	Rv0jmACvAdxTOVVFfgT2jigtMxhCz6UlBlCuTCMyuOJuP+MaEaSh2I/jzSZzNk7Xxx3qrx3jyWA
	zK81e6pMSz9vVvu+fizwdOIrjRasqfRvW0QrAVBt03ktYG9r0fqsFmHLkRY6Q9mXC11D5ZPxpzp
	Xdw25Luvz//9bBi4frRDRiey5B2jAUljKgnyGrBaDowDsb7x/2CszqCkatERX6HQvLYWXW1S34M
	z+JU+pEYXsvGQSqtQp5WMvNtCMSZhsQIe6f5FE/qd8897lA5Z1+KrFQrd8PjMejbzuXcqRoeP1R
	hw8W73JLYdt8s3bMlQmK5aE0PY7zkCUKDc6UJNcPx2bHvLAGswp59wVbGHWJ+Kdt/m4sgNiBthM
	aK8A==
X-Received: by 2002:a05:6a00:189b:b0:89e:cfbb:e8a2 with SMTP id d2e1a72fcca58-8b66c3b368amr1764637b3a.4.1794170459589;
        Sun, 08 Nov 2026 12:40:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821c57sm690773b3a.37.2026.11.08.12.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:40:59 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function support before evaluating it
Date: Sun,  8 Nov 2026 12:40:56 -0800
Message-ID: <20261108204056.28049-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the WiFi device has no ACPI companion, or the firmware does not
implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:

  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)

Here the handle is NULL, and acpi_evaluate_object() returns
AE_BAD_PARAMETER. All callers already treat failure as "no policy
provided by the platform", so this is only noise.

Bail out early when there is no ACPI handle,

Seen on an RTL8852BE in a desktop PCIe slot.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: remove acpi_check_dsm()
 v2: check handle separately. Remove Fixes.
 drivers/net/wireless/realtek/rtw89/acpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/acpi.c b/drivers/net/wireless/realtek/rtw89/acpi.c
index ebb6cf555747..d8cf8eb2527b 100644
--- a/drivers/net/wireless/realtek/rtw89/acpi.c
+++ b/drivers/net/wireless/realtek/rtw89/acpi.c
@@ -372,11 +372,16 @@ int rtw89_acpi_evaluate_dsm(struct rtw89_dev *rtwdev,
 			    enum rtw89_acpi_dsm_func func,
 			    struct rtw89_acpi_dsm_result *res)
 {
+	acpi_handle handle = ACPI_HANDLE(rtwdev->dev);
 	union acpi_object *obj;
 	int ret;
 
-	obj = acpi_evaluate_dsm(ACPI_HANDLE(rtwdev->dev), &rtw89_guid,
-				0, func, NULL);
+	if (!handle) {
+		rtw89_debug(rtwdev, RTW89_DBG_ACPI, "acpi dsm no handle\n");
+		return -ENODEV;
+	}
+
+	obj = acpi_evaluate_dsm(handle, &rtw89_guid, 0, func, NULL);
 	if (!obj) {
 		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
 			    "acpi dsm fail to evaluate func: %d\n", func);
-- 
2.56.0

