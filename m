Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883576;
	b=ty3TsCAHZIDZh6cjd/ryfYstinmFRxxMJigxeMK2t0MAImTFtAk1Q43QokPC4yO9IHAN
	 AeZVX518qRPnIFUfyPzXjWNr9dfHRvfrp2/OJ7VWeF+sPXvYB3hbhQzO4qt18KyC9oEvp
	 mcGQHHMox9KFZNQRGdsDiqcPHJBaND/8K/sYJR6B8qiR9RoOXa1kxhYLVIl+ki1hkvurI
	 KF6UeOau7Yk/+ahi9dGE48m+qk4bJFjMfd4lYlU+g38pdx7lYNoon5xdc21MML+xHWvsH
	 trvxfoIxIVnVKWadwM1NZfpAK7Oa9oNNkRX+dxQNO1xRkqFpaAwpJ2fBE6WxwT6Eo/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8m9uPRKB5hURQbestWEfp8VpcR81mprP/hvCunA8DPA=;
	b=S4Ny75InGwtQHMMv19th8bZ7VJ2tuMvEf52uKXH/7SgwcinXODswmJbdswynJxXKgKbs
	 Vq3pFTQ5/nTdHDYTfvmD0+q117JEyKfO4Ey3dUs6HeR6Gf0+leivreaFdcTgICV4lnO4t
	 4+WNoEff2b+3MPFGzTvic3qXg5eBt4vTLy7YBrd0Iwp8XmBblZ+fI4FPc2xe9t3PzxM3n
	 NVOOlA3re+cwNVziitDXc7hVuUbBQXlfvvIiDrIPb9cjfaF3vP7qy15WnEHWcdlaLaRAC
	 2dL9q9OB+1b+aq+IgU7y2u9TvYAtu2Y0e3U7FB2K1ttOx9uT9lWq+LOTjNAaU6QfjaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAy7nB3i;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E5606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 02:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAy7nB3i
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-372bdb942dbso3734931eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 18:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883575; x=1795488375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8m9uPRKB5hURQbestWEfp8VpcR81mprP/hvCunA8DPA=;
        b=vAy7nB3i4P/JVaIRIlkHaRwgEZoBSOw8FBmRmuANWjGSVcOZAurIjYjhWy3gMsP63G
         LhefMuDmht5Az33QbRif+DCKdEmAAUfvkyA3nB7n3e8FQ0Kn1S4PsmC63zzV44BB/peb
         5bxLwgOV7fFY3D1zA9s19NIN/87K7v/BMJrdn5enI4PyseApPLIbC5QIXdNuK2WLNpyz
         gFYQIKUJDbXTBhNtZjYjIDp5VpgUZoOlOYxoSL/JlSjIRreEehliNyIyFh/PIeFVTzxh
         b+ToJH2euIsKqbVtS/cn/2fcE22y1V0Sf8BBdID2MmAPiSVifSn2F5D+aaHnTReKJBWL
         OHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883575; x=1795488375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m9uPRKB5hURQbestWEfp8VpcR81mprP/hvCunA8DPA=;
        b=Tre9FXjnRmQdTuZGZ97svjSlT+5Hdu1ZXH4ll4tDYMV3BdW1Yz0wud6ilYGe4qjE1a
         4ZxUbDAdoNyWTZHfZKLpPOX/9Sq6xLk2z3ALu1CKgRk3C/ITll52GK78Hojs9TJENi6n
         GnKiW39j3Jqky4nmtmVgGWS38vu0VbU9CYddhH8Q/RhhoXEb2sc2TJVddWOyq0Vd5vtu
         vEp5miQyTWvvijmnhPZJg82CDljyIoqUzvpU4zZq99Una3mHk9GF1T6vu7ZbXPN0akZ6
         sOeWYDJHa9Ui+5WnvOihEjHqbo3a9+TC0b9xztqGRwJSESIt78GFinG8dRB5zy8WFMSp
         TSAw==
X-Gm-Message-State: APuU4Z/YKHgKy3blHdgUX3GOZlzrI/1MtezbSt8EgstbKXM5Wg7KEkzJ
	WlsCHm5tMrCD2yDUE+zlsShpE9rWTDYW721P0QciBnG7YTSGZt7D4dU1a/3jog==
X-Gm-Gg: AZFdTZdQWtvodLOwMUZFQ8du0cNnIRwN8/tXD3qJWwpZEOATxq1MEy2mDo3w8GdLWw1
	2GiZUzscsc6Vkd+JzElFAn5SFLptrLBT5pgh1PWEwDyFlNKYoP+YNN47MoqHQZ1EVExwghPWSp3
	zBjBj+OKKr9hNjtPojY7lvl6WUUHOqTvGs+FkCUHWEJvTAJJyOLYW7kmOs8dgmrGo/LlqPNKElo
	kcW+p49BUpTQ6d3fHYOZ/YqvxKRfDEbTHdkydBl2oJyw9+L07xVpp2xvs7+GcS6wN48Ut6Nk+rw
	ERYxDiuoBgaiY3XqGIpKWCQJB0KkX0UQ1zjyO+MYPoR2tDCeP1/7Htn5inqUaMwA0gh0LOZgkp4
	Y6huz4AlJcSRy+A+sWs/9ynl1asUzlh7r5T7WpNL1ZX5MopYMKCrDE2M9CndQwyEWKgqe0UlqkD
	T38zeu8+B2lwKKypioEK+b2rDn1wZjxSJvWVj/Q03o8LfOKOSTvRAYwBi+zJuV5dWsFFHU/2eI7
	iiMaW1qbF5jdLt62hEWRvY9v8tTe6BNO8FRi9d1Iz6L+A8JP3MauWn3U9UVd8RJO7cbFyX/eLrZ
	M+sdXy77u1JStF2ECVXbeeAVU5/RzagamR0d/l1BMyPrngavCe+d/ITlCJb+Cz/+s5yuveoY6RV
	pk7s9/FIlFtcu/O4q+mH5lindBW5urOsi41zVuZRRDkVA8QgSRvHXU0/Bn38stNDThKn6MYbhvQ
	CaPA==
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr8269425eec.36.1794883574689;
        Mon, 16 Nov 2026 18:46:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm3809375eec.25.2026.11.16.18.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:46:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>
Subject: [PATCH rtw-next v4] wifi: rtw89: acpi: skip _DSM when there is no ACPI companion
Date: Mon, 16 Nov 2026 18:46:12 -0800
Message-ID: <20261117024612.26239-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

When the WiFi device has no ACPI companion, ACPI_HANDLE(rtwdev->dev) is
NULL and rtw89_acpi_evaluate_dsm() still calls acpi_evaluate_dsm().
acpi_evaluate_object() then returns AE_BAD_PARAMETER and ACPI core
warns on every probe:

  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)

All callers already treat failure as "no policy provided by the
platform", so this is only noise.  Bail out early in that case.

Seen on an RTL8852BE in a desktop PCIe slot.

Acked-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: add Acked-by. Remove stale commit wording.
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
2.56.1

