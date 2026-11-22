Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353830;
	b=F8JtBDA971nv1V2qqMGlfy99c50L1beO8oW0YfAMXiKvDpO33QoFsRzV1Qv9319zPlSB
	 Fe1BSLOYH989sCOVui1ZWlcmxYvq8g8yYhOOwYjLvOwVRaNpYX5ip2UAN/lt2zX4Gytew
	 j8dfVVLsXja2lwjScM1vFJzGj9SpdnauueWMl8btvUIon1MqaIIlrBMoom1V3Nyop7OqZ
	 kVraEUBiiNHD+z7cHJpJc1i0iR8s0liGmH5vd8+tW/eJe2yjGAkCSBzJxMyvdycX6/AAv
	 qlBgWqjA/yVnvxOsysBZ5ir/nXXJpko/Djj06hz+0hJyIaKMy4P3V/jHuLhd9Ex92DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jzqGpr5s49CrPSQcG6fEVlkuwOk32UJMwbrZ+G/YviA=;
	b=l4hjsabEPqkCpYcnpGQAPB+oKeM2KBf0KPYx0hn+aAGHPQsxBmbSvbfZgoeEgJ5demUy
	 X/D9zBXqyKTfKbTgdTYDNeQeRIe2xBvT+AmcH+5BY9696OyNttAaBc50bmVf3OPH8AQVu
	 WW7uPOYCoaYyBH/zN3xyVno3Zw4/F2JP9prDvhmDmxj9/cnim+ljOFzz6LVJVIk/sDIUL
	 O7cP9892Y8be9DeZcVOPxN/NHLc8dRULXGTNa5YX1KuUpVISaJ80cR1sGbtpDfx4SjCdI
	 6td8XxH/qW4riKdFXRZSlmvgLVAHVoEqUuqnX3CPajdP8frcN2w2sfRNHZVsDl0/LFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cj1J/LmI";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B848606A32C
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B848606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cj1J/LmI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso30288325e9.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353829; x=1795958629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzqGpr5s49CrPSQcG6fEVlkuwOk32UJMwbrZ+G/YviA=;
        b=Cj1J/LmIEmV0dSxW9U6IsK29QDH979sYXuqsCC48V/vyX/SnsE19qbVYnsFzmDKp+W
         MNKpeLp0MIr4KLOtrwbjiIjnwsVLeFE5sqS9yG4w7kbNKgo4v3AMESqnUa+1nq7E9Gsc
         RMIKfGM035hyNmWzkmNtA90C0iFA6t3MsZHJEOuBQbDwzxQW9NRa7qyqsPSjWN7Cek8U
         QWa6rjKU7waQU6nnbOa3/EY9JiIWTEpQcyESwSnYyCDMvkWDFNoQjfD8Z1ltaC2nft6B
         YxwxaeEXYBYlSI0xwyvScStdm+YPJTaqJHwI2WpKnjWCKloSAqLkxaHZczAA82tTWNiw
         JYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353829; x=1795958629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzqGpr5s49CrPSQcG6fEVlkuwOk32UJMwbrZ+G/YviA=;
        b=w5wOR1AmLoXn1MZnYpjUFbToyJ3IuZhFyxWwJ8we3s5ZLso3Y8LXWc3oH0NHqxtlQn
         HCke4bM1O/pyYJda9OxkEZKoGNBf2/mIvpvFZ9RrHG0Jzcj1ZnXwxrpv1au/E2fVpwIM
         nUAqUaNuAODNjJSQU+HVNNiPdsBurFSdFy2RD42eN0SgMX69OHcQgKEQthInPsp0Z0mw
         3Ow3cA3o1W147EQQ/URM7JsSyVm4Lzel56sJiAcoW4ByX6zsk8Ce2NyyrqLc4GuFMsvJ
         QqxIE892dpDtp4tBLJ2w2oI63RdOY5Qf5lxkcfe8k8yYf6LIfD60sU6MndzzYdp3WL+t
         v/Ug==
X-Forwarded-Encrypted: i=1; AL+hErHfWA6H43n9FZwR2E/cJ+e8JNDmxksk0A1s1PqsCO+Mix9bjQitwUGVTWzY+/DpMbez9bz+KrGoH64St9XeJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rn4BmcVpDVfDx279SVzS9UNZPZ3jofhSW4gvjp86mGvUd/ZKx
	9uQ9PQ3VpAjlcIOYNwY6Icw2Xt//vNrDKUu3ui92/v/EOCqzjU8zBfrd
X-Gm-Gg: AZFdTZer6Gt6whzMZEpH54RC9/DENmJv23mP19Q6Z8mmjz4eOoZDFyMj1bBVIC5B9tl
	GT+MyrilZj1aNrB3xCo2XMM4FGgDh/zH8m+5wkWawx4oV7CugvX/OxMgz7UCWug8rVjSvCsVds4
	2sj5D7EwQ/XZKs3dXnYH/pZVDRDuKSZePcbSulfrYi8Cey05jEO2n+QxC1DT7UnTHlb3u1CAQR+
	gJemL3VyORE+zfJqCGMXP2JA6NmTk1KtvfJ69oangsOcFB/BsPstf1tEgvwRpAz7Da912JFGnvk
	PJdT1H26FjMn/ThOBvRxaspluDQQePG9X458AwysMFCMn421lKVgQf2vjaoL9lK1PxWGpEgf6Yj
	oG9Mzsu76L3HcWlR2vLpGvppjVyWA5qFR2hNXE9RshiRhz1XC7GGeaJTpbDLpImZyslKbMNDhIE
	hFkEaG4xd+2ban+YYJ4OlK5mo2pgBZrSP31Piu0Ju9GKcRv/Qcm0dxenjmwXy1vsy1LDV72tOew
	NVM+miryflLAk2psqpG2bac4W+DnM3qcDTbHqwAgUAY40Sj0QTxeEKpb2fH4jhVCq8jQgrjf1ax
	6T1ZabDLs8CB/mYfFPqoaiWuhhAigSJt5mZFN0DFbmehRteM1hVjC5gGOWvkjzj4XlC12BmkbAS
	58kQiGRZ5nZwxnTWPf9UkPQDLDUkVbH5AyfCZKZydsPA/9X1qLK6sK622U2bThx/wJY8Ax9+L0E
	XZ3btRL3Rgg+ALVsqbEKYlg4aHrUccBCpv+tFpM+j/UhHM32cCR8IzWQ==
X-Received: by 2002:a05:600c:4313:b0:4bb:643e:3b8a with SMTP id 5b1f17b1804b1-4bb86162fc5mr148179735e9.17.1795353828613;
        Sun, 22 Nov 2026 05:23:48 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-20fd-ec9f-e3f8-60d4.ipv6.o2.cz. [2a00:1028:8388:a84e:20fd:ec9f:e3f8:60d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm16729671f8f.58.2026.11.22.05.23.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:23:48 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: stable@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH 6.18.y] wifi: rtw89: usb: Avoid crash with dynamically added device ID
Date: Sun, 22 Nov 2026 14:23:46 +0100
Message-ID: <20261122132346.53002-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122132329.52933-1-pepe.schlehofer@gmail.com>
References: <20261122132329.52933-1-pepe.schlehofer@gmail.com>
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

From: Bitterblue Smith <rtl8821cerfe2@gmail.com>

[ Upstream commit b1827227176821af9bba0cb643728d23328f3660 ]

Adding a device ID via sysfs causes a crash when the device is plugged
in, because the driver_info pointer is null.

Check for null driver_info in rtw89_usb_probe() and add a wrapper in
each driver to pass it a reasonable default value.

Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
Link: https://patch.msgid.link/7a537b2e-67d2-40fb-8ef2-fcbc7bbc93af@gmail.com
[ Dropped the hunks for rtw8852au.c, rtw8852cu.c and rtw8922au.c,
  these drivers are not in 6.18. ]
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
Compile tested on 6.18.64 (arm64 defconfig with the rtw89 USB drivers,
W=1, no warnings). The probe through an ID added with new_id was
exercised with the upstream version of this fix in backports 7.2 on an
RTL8922AU. The commit is requested for 7.3.y as well.

 drivers/net/wireless/realtek/rtw89/rtw8851bu.c | 8 +++++++-
 drivers/net/wireless/realtek/rtw89/rtw8852bu.c | 8 +++++++-
 drivers/net/wireless/realtek/rtw89/usb.c       | 5 ++++-
 drivers/net/wireless/realtek/rtw89/usb.h       | 3 ++-
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8851bu.c b/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
index 10fcfade615..f9078923bba 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
@@ -32,10 +32,16 @@ static const struct usb_device_id rtw_8851bu_id_table[] = {
 };
 MODULE_DEVICE_TABLE(usb, rtw_8851bu_id_table);
 
+static int rtw8851bu_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	return rtw89_usb_probe(intf, id, &rtw89_8851bu_info);
+}
+
 static struct usb_driver rtw_8851bu_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = rtw_8851bu_id_table,
-	.probe = rtw89_usb_probe,
+	.probe = rtw8851bu_probe,
 	.disconnect = rtw89_usb_disconnect,
 };
 module_usb_driver(rtw_8851bu_driver);
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852bu.c b/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
index add5987110b..fbeb3f5b737 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
@@ -46,10 +46,16 @@ static const struct usb_device_id rtw_8852bu_id_table[] = {
 };
 MODULE_DEVICE_TABLE(usb, rtw_8852bu_id_table);
 
+static int rtw8852bu_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	return rtw89_usb_probe(intf, id, &rtw89_8852bu_info);
+}
+
 static struct usb_driver rtw_8852bu_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = rtw_8852bu_id_table,
-	.probe = rtw89_usb_probe,
+	.probe = rtw8852bu_probe,
 	.disconnect = rtw89_usb_disconnect,
 };
 module_usb_driver(rtw_8852bu_driver);
diff --git a/drivers/net/wireless/realtek/rtw89/usb.c b/drivers/net/wireless/realtek/rtw89/usb.c
index 512a46dd9d0..faf1e471e30 100644
--- a/drivers/net/wireless/realtek/rtw89/usb.c
+++ b/drivers/net/wireless/realtek/rtw89/usb.c
@@ -931,7 +931,8 @@ static void rtw89_usb_intf_deinit(struct rtw89_dev *rtwdev,
 }
 
 int rtw89_usb_probe(struct usb_interface *intf,
-		    const struct usb_device_id *id)
+		    const struct usb_device_id *id,
+		    const struct rtw89_driver_info *default_info)
 {
 	const struct rtw89_driver_info *info;
 	struct rtw89_dev *rtwdev;
@@ -939,6 +940,8 @@ int rtw89_usb_probe(struct usb_interface *intf,
 	int ret;
 
 	info = (const struct rtw89_driver_info *)id->driver_info;
+	if (!info)
+		info = default_info;
 
 	rtwdev = rtw89_alloc_ieee80211_hw(&intf->dev,
 					  sizeof(struct rtw89_usb),
diff --git a/drivers/net/wireless/realtek/rtw89/usb.h b/drivers/net/wireless/realtek/rtw89/usb.h
index c1b4bfa2097..fe0f86dc779 100644
--- a/drivers/net/wireless/realtek/rtw89/usb.h
+++ b/drivers/net/wireless/realtek/rtw89/usb.h
@@ -59,7 +59,8 @@ static inline struct rtw89_usb *rtw89_usb_priv(struct rtw89_dev *rtwdev)
 }
 
 int rtw89_usb_probe(struct usb_interface *intf,
-		    const struct usb_device_id *id);
+		    const struct usb_device_id *id,
+		    const struct rtw89_driver_info *default_info);
 void rtw89_usb_disconnect(struct usb_interface *intf);
 
 #endif
-- 
2.54.0 (Apple Git-157)

