Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871124;
	b=3WWj7B+niZ71KAUOIC0JtejwNnlzsvJP0Alt8pmIrM1FDyBhcsr4hFoSpFIR2wZF9Ubu
	 2WuDDmYlTVSVP2f36ONUGZOq1D/WOxo9wA2o4cj9Zd5/3WUhujfz6KkbNsUReDvUwAh6F
	 2pHynonlQyjB+sEGI0X031sS2dcqUXkuPMJB6XOnuQEKucLGQUWJNjOVMO6S57L7b2YMt
	 AOT67gQLZKcVP7hRTxbl+hGYa8Axzy+AHqXX/RwTxJ6Vi/IyWvP4JqF3t0nHvoV2/C3rL
	 GmItXMRRoRKPeFlCohw0epJDe4Rw7iozt+trVoNsRSPzzxJs1SQJCbg3llGQ1a4JbrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=js+P2Gd0L3tMlYVIQF8CICa6lPhijwgYtfOX2eYH5ts=;
	b=BEZbQrSEfOpRSJK1yrYPPBOa+o317mq8yKxndVdlWnxJLecDVUtxiPSgRejjaDbKF5Dx
	 zUJ3H9RZ30i+eJYIC1yBveApT2mpf5ol/+v/vy1H6Pb5ks882ousHeygcc8lVA+V7YHT8
	 0U7qx+52ga7O32uyT9KRuSrGPAbyf7DR6fNnDyhX1Gev1kE+Eoi0AO0u/jsP8BVyXMync
	 KGFFgpAlzfE5tipVEk8RqIB/l2Nn9D43SgPoH7kRnXuKS059xETiwNKyDGz4zItpsDZ7p
	 +VB4Y98bKdKb2ttJL6e+6BKePAtjBGJMMeltQkcvvuD3N98200SZuyeM4Te7MGAAu+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4C1606A333
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4C1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-563a0462094so2573825b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871122; x=1795475922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=js+P2Gd0L3tMlYVIQF8CICa6lPhijwgYtfOX2eYH5ts=;
        b=LnwcAGjUrNxDkB02IS0NNATXGCY/u/Q3ynvANzFU6R4LTNnoWy4MPYMGWbxTJceNLv
         IbNSK+w1QebaH7lF0JFH5SB8aEVvdxk20D8nesaa2BkYWNcyDceNoNEicTdv4Qbl68lV
         i4jgX88E4OX6U+UnaUTB7OE7Cn9IAmUXAdJYubwYPTbEkY1iVjQ0OXaa0ZhuaGaGxmrp
         2fdICf+BvyS535yGPiQpkgtfqvyCdJlbfcYKiafAVtSOz3tuPzlAlqc+UwckY4h3BqYy
         LduipY/Yh0obSmMpwH4utlYLmK3y/v89qEnEqbKK7IOEJa+W9tXMmC5FuqBxH/QXK2kr
         FATg==
X-Forwarded-Encrypted: i=1; AL+hErFF1qHRd5q1jjo7q/jA2jprvfGt1SH9VyCAwG9ZGhYD76kcJFNAhQD2l/T7TeEyrrNqIAO3p7qZ0i1guiU1wQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LotlqwDN6IByEw4t+753FzOvOXwHUvgxGkSygMwTSLYNd4W8C
	V1Z2+9ENWkdTBWiCAQeaLa0CQS3M8o1exprBy7KOjLJjHwaSWGg2Ly2JR0uJGQ==
X-Gm-Gg: AYBFou0rwTxeuetJABpk/jMlqzNveRD3RT7yCU/AGAzmnYUpCHNw//j7tmnUL81sn2Q
	x+2S62+cBmSk2ZGwdGshD62Uxw/XNP31HaJiTX469lSkLiyK0ELpRdQf29ooepNRF3K5UfpVaVN
	+huSQFWvLgjKp7z8SEHyCS7cPxZ6Curxqoej6DyoQRzHFDAk0QvIshmCxkIbmV09bQdzLrTOZFx
	B6+PpsXrQZNBHreTPCr1RLiJmsZ0bO2blPTEupjqrUwh4wRO5Psn4R6LnPveI//qJhgR6cDxbKy
	pRFHkBS9CTR1Pz4MJkLiqCWzJxw6HZhCqNXIA+VGtS+VVDtumayPByg7PhoVgr15mCe7ypZC1Af
	zPd75XWvt5m+K/9mwnfBU6s8jzsd0KxooQjT6mo5L59yU4ktc1r85ss0j5rckJigSC51uhyvUVy
	lx0KJXnicaTpmPlmNWKVxoGyYbawz/dxdMFuSnKWaLiLEvp8MLlVb0ZqSjwdELU4xgmcWTFLnzd
	tEVTl/Mkw0DZg9dxzgZtIPnTTddhDv+of3msKyta/zmDgkSeoNXSzTb/5emxux8WLJb+3woxIUy
	tFL1ge2/2UrTShYdcrbGzsTipY6CpZI1pivoiqUAkZRkCNU6qdnuwxFWnJzfXs7X0cnbJwvp5pU
	l/nF8BGR0Aw==
X-Received: by 2002:a05:6808:1a1f:b0:551:2eeb:d53c with SMTP id 5614622812f47-56e65012cf8mr10446785b6e.44.1794871122272;
        Mon, 16 Nov 2026 15:18:42 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:41 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 03/19] wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
Date: Mon, 16 Nov 2026 17:16:14 -0600
Message-ID: <20261116231630.1733906-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

NAN RX group keys are per-peer: each NAN peer can carry an independent
IGTK/BIGTK, and each NAN_DATA peer an independent GTK. Add
nan_rx_igtk_wcid and nan_rx_gtk_wcid to mt792x_sta to hold dedicated
WTBL entries for these keys.

WTBLs are allocated lazily: mt7925_nan_sta_wcids_init() marks both
fields MT792x_WCID_IDX_UNSET at peer-add time, and
mt7925_nan_peer_wcids_free() releases whichever slots were actually
allocated at peer-remove time. Peers that never install a NAN group
key carry zero overhead.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 47 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 11 +++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 222836699d15..490507ce97cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1001,6 +1001,8 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta);
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1123,6 +1125,9 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			goto out_pm;
 	}
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_sta_wcids_init(msta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
@@ -1376,6 +1381,45 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_event);
 
+/* Mark per-peer NAN group key WTBLs as unallocated at station add time.
+ * Pairs with mt7925_nan_peer_wcids_free() at station remove time.
+ */
+static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta)
+{
+	msta->nan_rx_gtk_wcid.idx = MT792x_WCID_IDX_UNSET;
+	msta->nan_rx_igtk_wcid.idx = MT792x_WCID_IDX_UNSET;
+}
+
+/* Free a lazily-allocated per-peer NAN group key WTBL and reset its sentinel. */
+static void mt7925_nan_wcid_free(struct mt76_dev *mdev, struct mt76_wcid *wcid)
+{
+	u16 idx = wcid->idx;
+
+	rcu_assign_pointer(mdev->wcid[idx], NULL);
+	mt76_wcid_cleanup(mdev, wcid);
+	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	wcid->idx = MT792x_WCID_IDX_UNSET;
+}
+
+/* Release any lazily-allocated per-peer NAN group key WTBLs for a departing
+ * station.  Called from mt7925_mac_link_sta_remove() after the primary WTBL
+ * is already freed, so the NAN-specific cleanup is clearly separated from the
+ * generic STA teardown path.
+ */
+static void mt7925_nan_peer_wcids_free(struct mt76_dev *mdev,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_sta *sta)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+
+	if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+	    msta->nan_rx_gtk_wcid.idx != MT792x_WCID_IDX_UNSET)
+		mt7925_nan_wcid_free(mdev, &msta->nan_rx_gtk_wcid);
+
+	if (msta->nan_rx_igtk_wcid.idx != MT792x_WCID_IDX_UNSET)
+		mt7925_nan_wcid_free(mdev, &msta->nan_rx_igtk_wcid);
+}
+
 static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct ieee80211_vif *vif,
 				       struct ieee80211_link_sta *link_sta,
@@ -1420,6 +1464,9 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_wcid_cleanup(mdev, wcid);
 	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_peer_wcids_free(mdev, vif, link_sta->sta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index cc6eb1562b5f..07004066e666 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -18,6 +18,11 @@
 #define MT792x_WTBL_SIZE	20
 #define MT792x_WTBL_RESERVED	(MT792x_WTBL_SIZE - 1)
 #define MT792x_WTBL_STA		(MT792x_WTBL_RESERVED - MT792x_MAX_INTERFACES)
+/* Sentinel for a lazily-allocated wcid that has not yet been assigned a slot.
+ * U16_MAX is outside every valid alloc range and matches the 0xffff value
+ * used in mt76 DMA ring entries to mark an unused wcid field.
+ */
+#define MT792x_WCID_IDX_UNSET	U16_MAX
 
 #define MT792x_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
 #define MT792x_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
@@ -149,6 +154,12 @@ struct mt792x_sta {
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
+
+	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed)
+	 * Note: TX GTK is interface-level, see mt792x_vif->nan_tx_gtk_table
+	 */
+	struct mt76_wcid nan_rx_gtk_wcid;    /* NAN_DATA peer: RX GTK WTBL (per-peer) */
+	struct mt76_wcid nan_rx_igtk_wcid;   /* NAN peer: RX IGTK/BIGTK WTBL (per-peer) */
 };
 
 DECLARE_EWMA(rssi, 10, 8);
-- 
2.43.0

