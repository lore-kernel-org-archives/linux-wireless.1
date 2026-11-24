Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=kYSCmxbJS72PHYq+xd8DvHMm3M9jwun2oQ9x95W5LqsHX/ICB+HOm5tJlwrwsVTP7Of4
	 mY9UPbe9DUs93EvK/BSKE8zvougwxqZ6AVKC3YjNi13Coo+uZGmYjeZs/KQ3iBIiONrVE
	 25ywvrHXoX+um4MteVAZPIlXhjJhIqq/FueJn6tXsqXjfeG7Cqc4ZUPyCz5Jt5Py5pqtb
	 1+GlxH/qYCmUaqx9oG+zDklAtoLiWe81SgvIP+2DbsExdsnFNLUox6tVc+UskFqMt0hSv
	 3UHgdmCPU9wioVtIszniaEJxeSJFdr+jBxGK3TlpDtM5TcD5XymHppZVddK14LuLXbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=roid+xtkNoHYJwt9f/w64SUGkCNQTp9gpi+WsHE661E=;
	b=gLojE0Sm3ve6PpK4kBeuVWp6tSmbM8xI3Awn8/1SZ9+zCvkmq9vZyKNxj4gM0jDCJmq/
	 O93zj9Xh4lf+OifrHim12qGIDFo6wTlHVIvRhOD8807BbURgWAIC7CIlLJ9gmBD7AJCWD
	 7dHoNpReE3BflOvg7FnAyywRzB7wojMB+xtIuPTx8k03DS/7tG+0t+p4dkKtIunSK+ecb
	 hoccIpj897ktW49O2XleFkThQIAIRvUnJTRp3or/nDgtsFSe8P8Q4tgBHVIecBNSu4L/7
	 lFOLXpvYDTwuamr861288Ywatfi8oS62Y+9C11xAn6+70dVtdKxw3j3V2yiEtfEefqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QTzzhagL;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D2606A6A9
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2D2606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QTzzhagL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=roid+xtkNoHYJwt9f/w64SUGkCNQTp9gpi+WsHE661E=; b=QTzzhagLFcv0bMUULbdtx+qHWE
	72CMw1fiZGF4Ykdsf7Nza+cx/cIkS1Qhq+fq4P4/4CyLnt7JGMYQZOWORGQMY6MDzpOoeo1q+lIlx
	/SvGknDHusSrQEhYqOMGiNs+JmMnoIUqYcXRNE4znkljHarlryQEmfqnnRZHeHfJMguU=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7O-007dJf-0D
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:14 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/20] wifi: mt76: mt7996: check a TSF write against the firmware's latch
Date: Tue, 24 Nov 2026 09:43:06 +0100
Message-ID: <20261124084309.1981968-17-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

mt7996_set_tsf() and mt7996_offset_tsf() write the new value or the
offset to the UTTR0/UTTR1 pair of the band. They then write the write
or adjust mode to the TCR of the timer. The firmware latches its own TSF
reads into the same register pair, with no lock. A firmware read
between the UTTR writes and the mode write replaces the value of the
host. The timer then loads the latched TSF, or adds a whole TSF as the
offset. Reachable via the debugfs tsf file of mac80211 and, for the
offset, the mesh TSF sync.

Write mode 0 after the write or adjust mode, as the TSF write of the
firmware does. The firmware updates other fields of the TCR by
read-modify-write. If the hardware reads the mode back, such a write
would otherwise start the load or the add again. After a write, read
the TSF back. If it is not within about 1 ms after the written value,
write once more. This lowers the rate of the race and does not remove
it.

Do not repeat an adjust, since a check that races itself would add the
offset a second time. The race thus stays for mt7996_offset_tsf(). No
host write order prevents it, and the firmware holds no lock or
semaphore for the register pair.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 42 +++++++++++--------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index b778728bcecc..c220376cded6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2411,6 +2411,20 @@ mt7996_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	return ret;
 }
 
+static void
+mt7996_tsf_load(struct mt7996_dev *dev, u8 band, u16 n, u64 val, u32 mode)
+{
+	union {
+		u64 t64;
+		u32 t32[2];
+	} tsf = { .t64 = val, };
+
+	mt76_wr(dev, MT_LPON_UTTR0(band), tsf.t32[0]);
+	mt76_wr(dev, MT_LPON_UTTR1(band), tsf.t32[1]);
+	mt76_rmw(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE, mode);
+	mt76_clear(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE);
+}
+
 static void
 mt7996_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       u64 timestamp)
@@ -2419,11 +2433,8 @@ mt7996_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_vif_link *link;
 	struct mt7996_phy *phy;
-	union {
-		u64 t64;
-		u32 t32[2];
-	} tsf = { .t64 = timestamp, };
 	u16 n;
+	int i;
 
 	mutex_lock(&dev->mt76.mutex);
 
@@ -2437,11 +2448,13 @@ mt7996_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (!phy)
 		goto unlock;
 
-	mt76_wr(dev, MT_LPON_UTTR0(phy->mt76->band_idx), tsf.t32[0]);
-	mt76_wr(dev, MT_LPON_UTTR1(phy->mt76->band_idx), tsf.t32[1]);
-	/* TSF software overwrite */
-	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
-		 MT_LPON_TCR_SW_WRITE);
+	for (i = 0; i < MT7996_TSF_WRITE_TRIES; i++) {
+		mt7996_tsf_load(dev, phy->mt76->band_idx, n, timestamp,
+				MT_LPON_TCR_SW_WRITE);
+		if (__mt7996_get_tsf(hw, link) - timestamp <=
+		    MT7996_TSF_READ_SPAN_US)
+			break;
+	}
 
 unlock:
 	mutex_unlock(&dev->mt76.mutex);
@@ -2455,10 +2468,6 @@ mt7996_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_vif_link *link;
 	struct mt7996_phy *phy;
-	union {
-		u64 t64;
-		u32 t32[2];
-	} tsf = { .t64 = timestamp, };
 	u16 n;
 
 	mutex_lock(&dev->mt76.mutex);
@@ -2473,11 +2482,8 @@ mt7996_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	n = link->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
 					       : link->mt76.omac_idx;
-	mt76_wr(dev, MT_LPON_UTTR0(phy->mt76->band_idx), tsf.t32[0]);
-	mt76_wr(dev, MT_LPON_UTTR1(phy->mt76->band_idx), tsf.t32[1]);
-	/* TSF software adjust*/
-	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
-		 MT_LPON_TCR_SW_ADJUST);
+	mt7996_tsf_load(dev, phy->mt76->band_idx, n, timestamp,
+			MT_LPON_TCR_SW_ADJUST);
 
 unlock:
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 65a0ef6b1161..e6bf1151447f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -23,6 +23,7 @@
 #define MT7996_RESET_TIMEOUT		(30 * HZ)
 #define MT7996_TSF_READ_TRIES		3
 #define MT7996_TSF_READ_SPAN_US		1000
+#define MT7996_TSF_WRITE_TRIES		2
 
 #define MT7996_TX_RING_SIZE		2048
 #define MT7996_TX_MCU_RING_SIZE		256
-- 
2.47.3

