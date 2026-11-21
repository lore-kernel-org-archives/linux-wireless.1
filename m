Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288535;
	b=yOhmEnz2oQ/A5XZd5AvHWYNZ/W51rmVm9lrNh51si5cE4iWjjnFGm8AhN7F4+KttqzjC
	 PEchGDC8qCNI1//cp9no6uC3nWJ+s8qpW2aqnocleEUcuDuuW+sQbhCF9MuW6V+bLEul4
	 Ea23BLA5VGUIGM83agAQv612vOUiZsES93Q63/qizDPLEgBzh/eEJPkOQ0axmAre1TZ3R
	 feJuSxARCRL6JLGPCZAnJu58ak5sr5EWQadR6WdMd7rXFV7X4Wm0YPXW9Unb7iOk2KiAM
	 P0WfNiItX9M302nWdKTJxzOA/H3DnVX8PNf6tBiJtrnJKDWr1YIRIXc2sg3pMXTrUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
	b=QB5vKwrWEFDZUdV3JwR97OlacbLasRupWUFyvOZbO32mqhVR+dXN7E9gGZoXHJNZKFtK
	 xXbbxO3jMOLLG/KT8nbk/F363vJOagHzkK8AElLD/eAiu9ewT7PvM3U7WmiNjGHt2QTpS
	 /6LwVtinE9kWYaZX3ycJolLCqNxPhFLMSXOaBnSlQRr5whiZlKGHEof8KXKKYlrwDgNbW
	 y1WbFgmBJX5kUpLpakgCnD79vBpQeqM1EWOgkAo3kAhKI2kTOId8We7w6wVHS5NGllln+
	 1iVPe2DOLZjwOFGa088Y5WfoUkTeFKVKz7s5kCokiQdhnmZN/mopOWn7aifFFwxBm0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnS8tiTp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EEC606A69B
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EEC606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnS8tiTp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so18140735e9.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288534; x=1795893334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
        b=lnS8tiTpfPE4dg0mYKrGYfssEFamQPEGLAoyzR2JCXE6irosUmmvDQcJk0vhNZLTq1
         zb9kA1PEZcM9leahj1092Xidib2F+jgcY2p4mswjKZzsDBnzvEL+dOW/f6dNDsAWpS3b
         7yqDIW8vWZbDqOYyKAWko1800sdI1u5x3dVilXLSy2CxbP6MJilPj3iv0hmnYQttxPw8
         OjjaNaVZSi9AyXhcM4eEvEIEjLdSEXufmKwvDgbCmkBwJSz1Wn9ncHyRUwJ6eClq9XDF
         SuY5+pgLD1LdGPu16AeNAKv+hDTYO+W5VLPEt/iccQnEt6iun/es4JZ1UsBmz+2ys8yb
         q4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288534; x=1795893334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
        b=f7/GEnJoEV5dfKvqs4EZ51s3QxMYPOFGV3VXZs31l0S5p9Osw+DcfuHkf0pg9yIAan
         gRZRRQE/7eZXzE49oZefxxNnVcP/Gegj/CQR8wqF7AhmiOJDP70j/9OHa6uAcurHCKUs
         lILL+IzJa1dyNZxNNmCWjzdGQbBHHCr9V5xbZlIrLRfc0BOYvCMjOczK/bimy4i/fw/C
         7xGd7gERCGdcfaC3SmxT6d11g5SdKBSUZkw7nY2FZMqhWVOJKH0o8L8/GCLNR4sjG5zm
         zB5j272W9Yj1b5w020ullz3WHigkeGcds67sm9X76wIDKhI5M8N3jU5/iy8O2lTav9vF
         rzSg==
X-Forwarded-Encrypted: i=1; AL+hErERXgM1IH4gO9uWKScp6yKmbtn6BDx8+tPhZPm+2iJ5gJ0C/IwumtmUAd/RCFiOVnj51dhEllcrEkbRYf11ow==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KjWeQ6S4yDtIGMW2DvipTy3TkLHQbcctcHLQ6RCGEdlXtl2P4
	INPFfeS4ZNw2qA30lnHdpbVwilkXGQFWvMj1HrTUNyuy8Z4KS3WeCi7U
X-Gm-Gg: AZFdTZePJPJDqoWWTWhvx5LkwVLrQ8+S39xIloXL+tVKeK6DH0+eJthcOl7O8w4hQFi
	fy2DMbvofLB/UuFx9vzi4vh79MCT/QMQQIivXjTkQmf7atDOuhZ1BX/FqxdQw1x+kOsec8X4AMU
	ZqI793oCK71reNjMaCKSMzTnqtRDMJ1d1kkL31vyYy7p/rJhptoGtJk+xsxdo31aMQMaLZt2liR
	jxMWUEY6IO3Gqg4KIgVlS+mX3XRsIt51vizqxa1ah11K3QPPamZgkJo0LPxlW501IVyGVeqnH3B
	FlSrq1uDl7gbD97o5J7F7v06zfijmcHC80j9kU2BV6MKVY8/CfuzeiWAWqYV6lITf+b/ABGWo7u
	IGfgrMCT3YBSXUnhI8YGBvl/FufMmZHlmxx1ZuBM5CR91b5UeLqTqr2qKDmZnN1w4z96r4/qXSj
	6T70q7mJ1fsfhOssoV6P3eaWwa0clSKV4tS8qirP2PJDuNccbVGnBNck1W0QBbW8gjBK4yJe1fV
	BsecUCa+zu6R9aX/UL2yeqt4sqrGe8bIemOe1hLE8CoYBem5U8t+QtBZBtVHYzNsumDwgf0ABtk
	TyhvzZRiy5bWc9K3WsC+Ow/Nd0xAk0qdx6w=
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr158434805e9.6.1795288533611;
        Sat, 21 Nov 2026 11:15:33 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:33 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 3/4] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Sat, 21 Nov 2026 20:15:27 +0100
Message-ID: <20261121191528.591334-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121191528.591334-1-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw_iterate_stas() allocates an entry with GFP_ATOMIC for each station
it collects, and skips the station when that fails. Once the firmware
recovery resets the stations through it (next patch), a skipped station
keeps its TX queues on rtwdev->txqs, and rtw_txq_init() later
reinitializes a list node that is still linked.

Link the stations through a list node in struct rtw_sta_info instead.
All callers hold rtwdev->mutex and no iterator collects again, so one
node per station is enough.

Skip stations without si->vif. A station moved back from ASSOC to AUTH
has gone through rtw_sta_remove() but is still found by the atomic
iterator, and mac80211 can free it without calling the driver before
the iterator runs.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: skip stations without si->vif (Luka Gejak)
    v3: new (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/main.h |  1 +
 drivers/net/wireless/realtek/rtw88/util.c | 23 +++++++----------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 5291de0ea38f..2830a5a57d61 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -792,6 +792,7 @@ struct rtw_sta_info {
 	struct cfg80211_bitrate_mask *mask;
 
 	struct work_struct rc_work;
+	struct list_head iter_list;
 };
 
 enum rtw_bfee_role {
diff --git a/drivers/net/wireless/realtek/rtw88/util.c b/drivers/net/wireless/realtek/rtw88/util.c
index fcd6eb1ab32a..8ade002426b9 100644
--- a/drivers/net/wireless/realtek/rtw88/util.c
+++ b/drivers/net/wireless/realtek/rtw88/util.c
@@ -107,11 +107,6 @@ void rtw_desc_to_mcsrate(u16 rate, u8 *mcs, u8 *nss)
 	}
 }
 
-struct rtw_stas_entry {
-	struct list_head list;
-	struct ieee80211_sta *sta;
-};
-
 struct rtw_iter_stas_data {
 	struct rtw_dev *rtwdev;
 	struct list_head list;
@@ -119,15 +114,13 @@ struct rtw_iter_stas_data {
 
 static void rtw_collect_sta_iter(void *data, struct ieee80211_sta *sta)
 {
+	struct rtw_sta_info *si = (struct rtw_sta_info *)sta->drv_priv;
 	struct rtw_iter_stas_data *iter_stas = data;
-	struct rtw_stas_entry *stas_entry;
 
-	stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
-	if (!stas_entry)
+	if (!si->vif)
 		return;
 
-	stas_entry->sta = sta;
-	list_add_tail(&stas_entry->list, &iter_stas->list);
+	list_add_tail(&si->iter_list, &iter_stas->list);
 }
 
 void rtw_iterate_stas(struct rtw_dev *rtwdev,
@@ -136,7 +129,7 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 		      void *data)
 {
 	struct rtw_iter_stas_data iter_data;
-	struct rtw_stas_entry *sta_entry, *tmp;
+	struct rtw_sta_info *si, *tmp;
 
 	/* &rtwdev->mutex makes sure no stations can be removed between
 	 * collecting the stations and iterating over them.
@@ -149,11 +142,9 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 	ieee80211_iterate_stations_atomic(rtwdev->hw, rtw_collect_sta_iter,
 					  &iter_data);
 
-	list_for_each_entry_safe(sta_entry, tmp, &iter_data.list,
-				 list) {
-		list_del_init(&sta_entry->list);
-		iterator(data, sta_entry->sta);
-		kfree(sta_entry);
+	list_for_each_entry_safe(si, tmp, &iter_data.list, iter_list) {
+		list_del_init(&si->iter_list);
+		iterator(data, si->sta);
 	}
 }
 
-- 
2.56.0

