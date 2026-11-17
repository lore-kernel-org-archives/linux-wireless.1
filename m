Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899783;
	b=1BkuCQuTfTK6eajWaJrLixXBQv3jAXJMMqJqZdWhGnPWQnUpN1gvtNKEaIcBKLpOb12n
	 tyGABfGSRaxEiSYuzaP1/93GlN3KkGylbf5TdlasE1E8sHmmGVBFGaMbmt1YNCOLwDCoS
	 tj7I+FeclNaAv5/i0Wm9Fzjbn7fXE5B6dCsfJTeYca9T/iN1H0WxXC6IgMh80wu2p8jNz
	 m5N8vV0xGunpjNMxbEzO+7BxADNK/qtttxAmYYtAQzaqbD5Lk+AEMvcsiJrRbVvvcBmgB
	 Onp+YTUld6txXjViQxqfscFvw1WyEdO8DFRP6tuOzQlWSqquklbo/FX8jzkdkjvotWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
	b=48MStkyHrB3BIWx+qnzFVFNr3QRBm8wev55SNBaKK4pzH0ftPCUHP2IdecPPipYR7Tym
	 /icTJ1KwmNhxPbkCjC1k/s2cZiJrhuQIy55UI1hZX3LkZQMhDQuEceBUNNN8sXBXKO2EC
	 ruKRGuZJ53GPUPgcXsYaa8Xw3o44W9phAoDVP1dGkw88WtnIXvNqs8MMrLu0Nw/6In+E9
	 uXBFBLq00RHSJYon9B51Y63EaLlOeksnFiwSf3dy5XUSNcN8IyTYP7wk1HemWB80D3VBD
	 UKzsQkV39jo9a9076XFNwVTqWwkKUn29NdV7/QNNnGVMLjX5TovEue7yblDuNPi+fyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPFZdccK;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47968606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47968606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPFZdccK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso3898471f8f.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899782; x=1795504582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
        b=CPFZdccKdScZ/P5CkW5xdiXDwi8haBYzGVqQmHgTUTtsHXhXkiXkC4exXm9/+bfVqW
         1d7yZPNg7rETf6bH0y11Jv0euftyRe9Wmli8+6rgXtH5Hf9U+qo4sT6ELpLB9j4EDrXg
         9cDQVXetebzYefy7NtAyaNyGTpGm3pzNpzRtMrwP3Wba/WdjMuT1G0FSnzhzVKn5GzNU
         fYHIhOJDWC5FXtHJB1CVyuPTVAcY2WIcO9PQri1duRpZCAvVfWKlmuBU3zXXs+QSsCWU
         74BVbvYSpzLd65F7QryB8c7GkqRNKvkMzHfNg9F8TfOdhqoct45a1oNBoRMY9VewxvHd
         uNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899782; x=1795504582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
        b=2lWHDT6aruReTLl07Y2VgBQEbWW/dvkORjNJ75PjpKIRVG8237BQSsG0CLqRAkmD7C
         M/VBSvqZ7XGYnYTZNUen4qwRO4BknoYJEzPmiSDVEA3d8vuDkDdnyKXG7ymsNDiz/xPH
         u9IcNADtWP5B/Mevusr7ChSC/QPCC2aGMRwghFWc6NmShu3XnZDD7CH+RBoQGP3e3Jjf
         ZglRrcW8y2bec2HIyADaz04gYvRcUmgyMOIAm8I46WFP9BEhxwxIg057OeBTNp7yuRoj
         2VOvOG/6H0vTyP6HwgwpZJSS3SL870UgRSdvBU6XpPyEiTFmtLicEkiA8WaMGGmMQ76T
         BXxA==
X-Forwarded-Encrypted: i=1; AL+hErECPBO4H2qfiq7tzlgW57YVl8NOqnzr7JqjnocJXja/xEDochPiA/0X3b3QuTjqKhicuYiYARg/H+JEROnoTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kjiGVaNv38udsacOHHYiM2IFZ7XyFv1AA9RxKRClO7DoTaCMj
	Xn3Py07OmbCI7H973aqpIsSriJpOYO5uixFklZt3nL1wPqAsGwKGR3vH
X-Gm-Gg: AZFdTZdENFK2jWf9QQZiZXQsZ0QIIkIOiaXSftMCqi2yPypeureeUK8cmriTMSfSlmD
	8b6FGSDMQIZ3LkUiOOfXCaFphfVwcjxQSZbx8nzw8mALTAt4g2pbY/sQ+N68Aioyf7NAb6eViTL
	plLKdarlK4pBnwVUF9nJTiEifSujtnzSSd4YrUhRcKYZzysoeW/LutmaR4jSbvZNjj7at0YyqzD
	FwnSTP+5YEPhYPiV4UCgj6a8mQXHa3pOyMpZuueazOaMC0kOJtBce+LK+goQ20y9QK4c1H6IwqG
	YA3WMrqu1tu6KBak7i7D56riU20S0A3qlAFt8cir9a07uxLOlMOYawvCUAM9lUuTz0tVhLhWQHZ
	NRZAB8dZjmbIMWvDSQh0O2o8JvKRdMdsRID86TvhEj4fd1GWI9zQT7VXYIlag4cjFgCx0YFAok2
	P3OAxLoxa1Tja6GarTG/zCseNacgz4vH71Dyu4SNFWd2dRA4P3kdPw3Myjo8W3Dlvv9xr7qEEfK
	fLQXSVatkxYZvgY6GY8x2gTVOg7+OFGBovVdfqiYNc8qXT2vu+BL4VfOaOwQPQny9Dp3k5yd9w+
	ehq/DY5Uq1juoa16bQIbMYAU1QRt5gdzYdfl
X-Received: by 2002:a05:6000:4a08:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-49c6d63fbc3mr25184259f8f.1.1794899781483;
        Mon, 16 Nov 2026 23:16:21 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a43d41ec38sm1826552f8f.19.2026.11.16.23.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:16:21 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next v2] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Tue, 17 Nov 2026 08:16:20 +0100
Message-ID: <20261117071620.1650281-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_tx() hands the frame to the device and counts it in
tx.queued_cnt afterwards. The TX status of the frame is handled in the
WMI event tasklet, which can run before the sender gets to the counter.
ath9k_htc_tx_process() then takes the counter below zero, warns and
sets it to zero, and the sender's increment leaves it one too high for
good:

WARNING: CPU: 0 PID: 348 at drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:510 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
Call trace:
 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
 ath9k_htc_txstatus+0x58/0x140 [ath9k_htc]
 ath9k_wmi_event_tasklet+0x16c/0x17c [ath9k_htc]
 tasklet_action_common+0x108/0x150

Count the frame before it is sent. If the send fails, take the count
back and wake the queues it may have stopped, under one lock.

Fixes: 8e86a54715c4 ("ath9k_htc: Fix TX queue management")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
- the count is taken back and the queues woken under one lock, in
  __ath9k_htc_check_wake_queues() (Toke)
- rebased on ath9k-pending main

v1: https://lore.kernel.org/r/20261111215902.574916-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc.h          | 1 +
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 5 +++--
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 9 ++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index 59e0b3cf7f0f..0aaa6a96b86e 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -581,6 +581,7 @@ int get_hw_qnum(u16 queue, int *hwq_map);
 int ath_htc_txq_update(struct ath9k_htc_priv *priv, int qnum,
 		       struct ath9k_tx_queue_info *qinfo);
 void ath9k_htc_check_stop_queues(struct ath9k_htc_priv *priv);
+void __ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv, bool decrement);
 void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv);
 int ath9k_htc_tx_get_slot(struct ath9k_htc_priv *priv);
 void ath9k_htc_tx_clear_slot(struct ath9k_htc_priv *priv, int slot);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index b46be3682f21..3c52e66c79f4 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -888,17 +888,18 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
 		goto fail_tx;
 	}
 
+	ath9k_htc_check_stop_queues(priv);
+
 	ret = ath9k_htc_tx_start(priv, control->sta, skb, slot, false);
 	if (ret != 0) {
 		ath_dbg(common, XMIT, "Tx failed\n");
 		goto clear_slot;
 	}
 
-	ath9k_htc_check_stop_queues(priv);
-
 	return;
 
 clear_slot:
+	__ath9k_htc_check_wake_queues(priv, true);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
 	dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index 95f48c7dca15..4369a17fb4d4 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -65,9 +65,11 @@ void ath9k_htc_check_stop_queues(struct ath9k_htc_priv *priv)
 	spin_unlock_bh(&priv->tx.tx_lock);
 }
 
-void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
+void __ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv, bool decrement)
 {
 	spin_lock_bh(&priv->tx.tx_lock);
+	if (decrement)
+		priv->tx.queued_cnt--;
 	if ((priv->tx.queued_cnt < ATH9K_HTC_TX_THRESHOLD) &&
 	    (priv->tx.flags & ATH9K_HTC_OP_TX_QUEUES_STOP)) {
 		priv->tx.flags &= ~ATH9K_HTC_OP_TX_QUEUES_STOP;
@@ -76,6 +78,11 @@ void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
 	spin_unlock_bh(&priv->tx.tx_lock);
 }
 
+void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
+{
+	__ath9k_htc_check_wake_queues(priv, false);
+}
+
 int ath9k_htc_tx_get_slot(struct ath9k_htc_priv *priv)
 {
 	int slot;

base-commit: 465fcc982a221f774594aa7d7351fde8c03a3deb
-- 
2.56.0

