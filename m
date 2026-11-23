Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=aLBHGhJjrhPALA7n9iLshtzUY8yI6QuShMoLJHDVFAciXtrY9kPQEMdMd1PILd1n4VRj
	 2NTX4PAVje4pI9uaFJ5BSS0vwdBleWHUnu3NUDPDc1efI3drqeHzrU3hYzItpgVOsE9mc
	 Nx0ouboehvaY41nsJCytTHpETydRZy3CgBj6zxZUT9hteSLbO6HwHff1hnwUyHDOHb6M/
	 2uCQMQh13oZXwQvC1FR3YpeRXVdHCKg4d6PInfVWIN6OYBaCLMH97HFIBh8GLKJPznF8p
	 BrO5jw3BgDlviBxDIyREl41Z2RLFu6n4EBFfyXKp6EQx37PiRa2HiVsBJcbOdkZnz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=78/p+E9vIPfTxPrwIvkOloR19qGfKiTeRWMYxbMsMRY=;
	b=TMsHg5RNSUHF3gRiB8N3lDMWQl1rMMQ1cGiMAGLhGNccrF3BkW9/F7S1bkL+321hIIuc
	 karcOaa819arlHoQEC1fmDxpzXkUJg+CAxhfliLiC1+r5gh1IKtVNj39WyZVl81yszLVV
	 0RBo3CHPN4QyO+sYds8NRzFP3gwGcUIDVioE5JLrN0YeZLuPeG2eisgcd5PMU7qU028+b
	 VijP/Qof3rlgEBOxyQRyWCBkIWdn5yweHvNGJEs0Pq639iqlX91cIdnXIHgWcFeupjK6z
	 5x5peOOfkdn+BQZOZuccuE4Wd/1vxhnAphgVElxRobJgFQCNrL+pUot9OZI6QEzw7Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=evna1hCN;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3C606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB3C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=evna1hCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=78/p+E9vIPfTxPrwIvkOloR19qGfKiTeRWMYxbMsMRY=; b=evna1hCNjGNYa3AJIkC+STcGNH
	/FWJOju7/rypZnY+Fige1UCet/5287ZK+ur65SUDEquajFGfYhTY4TRLtrVCIjNfSS6Mjdyl7EFDw
	GA++Z1DRV9mk+wv7rOOh2aQYNudkmHcMz7inPTVcTksgrVdwlF95PiNdh7pK1wf+R92s=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-0f
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/20] wifi: mt76: mt7915: read the PS sync state of mt7986 and mt7981
Date: Mon, 23 Nov 2026 14:49:02 +0100
Message-ID: <20261123134920.154270-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7915_mcu_rx_ps_sync() reads the PS state at payload byte 1, as the
mt7915 firmware sends it. The mt7986 and mt7981 firmware send a longer
event. It holds the index as two 16-bit words and the state at payload
byte 6. Byte 1 is always 0 in that layout.

Every event of these chips thus clears MT_WCID_FLAG_PS. The host then
never throttles the TX of a station in power save.

Take the layout from the event length of the firmware, and drop an
event that the buffer does not hold.

Fixes: dc930cf883c8 ("wifi: mt76: mt7915: handle MCU PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 10 ++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6e1c3e5e2fe9..02426feb6182 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -411,16 +411,32 @@ mt7915_mcu_rx_bcc_notify(struct mt7915_dev *dev, struct sk_buff *skb)
 static void
 mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 {
+	struct mt7915_mcu_ps_notify_v2 *p2 = (void *)skb->data;
 	struct mt7915_mcu_ps_notify *p = (void *)skb->data;
 	struct mt76_wcid *wcid;
 	u16 wcid_idx;
+	bool v2, ps;
+
+	/* the mt7986 and mt7981 firmware send the longer v2 layout */
+	v2 = le16_to_cpu(p->rxd.len) >=
+	     sizeof(*p2) - offsetof(struct mt76_connac2_mcu_rxd_hdr, len);
+	if (skb->len < (v2 ? sizeof(*p2) : sizeof(*p)))
+		return;
+
+	if (v2) {
+		wcid_idx = le16_to_cpu(p2->wtbl_lower) |
+			   (le16_to_cpu(p2->wtbl_higher) << 8);
+		ps = p2->ps_bit;
+	} else {
+		wcid_idx = p->wtbl_lower | (p->wtbl_higher << 8);
+		ps = p->ps_bit;
+	}
 
-	wcid_idx = p->wtbl_lower | (p->wtbl_higher << 8);
 	wcid = mt76_wcid_ptr(dev, wcid_idx);
 	if (!wcid || !wcid_to_sta(wcid))
 		return;
 
-	mt76_sta_ps_transition(&dev->mt76, wcid, !!p->ps_bit);
+	mt76_sta_ps_transition(&dev->mt76, wcid, ps);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 76e39e899797..7dbe43200fb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -63,6 +63,16 @@ struct mt7915_mcu_ps_notify {
 	u8 rsv;
 } __packed;
 
+struct mt7915_mcu_ps_notify_v2 {
+	struct mt76_connac2_mcu_rxd_hdr rxd;
+
+	__le16 wtbl_lower;
+	__le16 wtbl_higher;
+	__le16 rsv;
+	u8 ps_bit;
+	u8 rsv2;
+} __packed;
+
 struct mt7915_mcu_rdd_report {
 	struct mt76_connac2_mcu_rxd_hdr rxd;
 
-- 
2.47.3

