Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=ggvE7IHLehw4/3PxnXidh04TXBwaiysiGzUT3s0pMUaIGpaVeU7LLj7ihp2LiZbri7Vu
	 EbJ1MVMMcez3ju1HBSP5rKTWGlTtDXvgHmi/YERwaNeJH35mWTb4AMmFeWpHpVJVIEVcp
	 APp80cA7a30mw7CpYCKc6iq0hxQdho2FGCjDhZqHCZ/aXLTWDy+JrgBjVvjO5g++tZXyX
	 zPRhUu3+Jhe+iu/g1g4RR7xCKj4RCEqlA9NeheMwSzt4UzIuQS1wQhd57ukv9mjj1seMC
	 BHKh5IvqkKEq14Mu8Db6u9v87RaJUE1nqh/TWRCyjHPJESP9AO3ekwMQ/oLG7N98wrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CMxmvKiB2th5KaJzaWLU9ebeen/kEwvmCKdZUvtEyDI=;
	b=chrwRtJ53kNTs/l9Z9wHBhWawJ2ipdUvs3FOy3h/UjAn36Kv0Y181taFFq8fIiS6Z+IO
	 zCjYEMFW/hS53r5EEeKc6xejHiggoEzENNcpbA/l0zpSnUOboBEFCRPbOB7w99S5VQtpT
	 nrfmWFitsd9AJau4o/uAO3ONcc3/VlNz1Iq3I//el92gEplCrsEpZhJH545AkMpngzNSp
	 MXip2XJQEMXNXQpdY4bi0dlQAkDZpMlFHoQ6Vc8mVlzWXOtjUhfw1M0RJFPX8vd7q+Bm4
	 J5GMJGKcFIt3FP97Nf8K0CI7mfx8z+JyPo/zJrOs/PkHDPABsm0bzpTWvfxrqjgJE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KEMjrvFT;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F129606A326
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F129606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KEMjrvFT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CMxmvKiB2th5KaJzaWLU9ebeen/kEwvmCKdZUvtEyDI=; b=KEMjrvFTPLkMH7Uojsk23rUPGr
	N3f2dfCrqZFxmNw9Fn0sZ9S1KCXQTwXki8yfIdIJfDadxO8QwuMqEi/OrrdK358EnQFZ9YsTv44Us
	oR6823sN7VmuPn1/17ZKVIzgVkDdx52hxTaz4xcs0M9AZN1+4RGxjZEVl+5iL4XiIsNc=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-1k
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/16] wifi: mt76: mt7915: count the WA TX statistics from an unsolicited event
Date: Thu, 26 Nov 2026 19:23:14 +0100
Message-ID: <20261126182325.2516607-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

The WA firmware answers the TX statistics query with seq 0, so
mt7915_mcu_parse_response() takes a WA_TX_STAT event as the answer of
any waited command. An answer that arrives after its own wait ended is
taken by the next waited command, whose caller then reads the wrong
payload. Reachable via a station dump with WED active, when the wait
ends at a timeout or an MCU reset.

Count the event as unsolicited and send the query without a wait.
TX_PACKETS of a station dump thus lags by one query. Send no query for a
station index above 255, since the event of the mt7915 chip names only
its low byte.

Fixes: 161a7528e407 ("wifi: mt76: mt7915: rework tx packets counting when WED is active")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 114 ++++++++----------
 1 file changed, 51 insertions(+), 63 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6a19f52d9932..74c632a27c12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -195,9 +195,7 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		return -EINVAL;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
-	if (seq != rxd->seq &&
-	    !(rxd->eid == MCU_CMD_EXT_CID &&
-	      rxd->ext_eid == MCU_EXT_EVENT_WA_TX_STAT))
+	if (seq != rxd->seq)
 		return -EAGAIN;
 
 	if (cmd == MCU_CMD(PATCH_SEM_CONTROL)) {
@@ -464,6 +462,41 @@ mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 	mt7915_mac_sta_ps_transition(dev, wcid, ps);
 }
 
+static void
+mt7915_mcu_rx_wa_tx_stat(struct mt7915_dev *dev, struct sk_buff *skb)
+{
+	struct mt7915_mcu_wa_tx_stat {
+		__le16 wcid;
+		u8 __rsv2[2];
+
+		/* tx_bytes is deprecated since WA byte counter uses u32,
+		 * which easily leads to overflow.
+		 */
+		__le32 tx_bytes;
+		__le32 tx_packets;
+	} __packed *res;
+	int offset = sizeof(struct mt76_connac2_mcu_rxd);
+	struct mt76_wcid *wcid;
+	u16 wlan_idx;
+
+	if (!is_mt7915(&dev->mt76))
+		offset += 4;
+
+	if (skb->len < offset + sizeof(*res))
+		return;
+
+	res = (struct mt7915_mcu_wa_tx_stat *)(skb->data + offset);
+	wlan_idx = le16_to_cpu(res->wcid);
+	if (is_mt7915(&dev->mt76))
+		wlan_idx &= 0xff;
+
+	rcu_read_lock();
+	wcid = mt76_wcid_ptr(dev, wlan_idx);
+	if (wcid)
+		wcid->stats.tx_packets += le32_to_cpu(res->tx_packets);
+	rcu_read_unlock();
+}
+
 static void
 mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -489,6 +522,9 @@ mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	case MCU_EXT_EVENT_PS_SYNC:
 		mt7915_mcu_rx_ps_sync(dev, skb);
 		break;
+	case MCU_EXT_EVENT_WA_TX_STAT:
+		mt7915_mcu_rx_wa_tx_stat(dev, skb);
+		break;
 	default:
 		break;
 	}
@@ -515,14 +551,12 @@ void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct mt76_connac2_mcu_rxd *rxd;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
-	if ((rxd->ext_eid == MCU_EXT_EVENT_THERMAL_PROTECT ||
-	     rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
-	     rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
-	     rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
-	     rxd->ext_eid == MCU_EXT_EVENT_BCC_NOTIFY ||
-	     !rxd->seq) &&
-	     !(rxd->eid == MCU_CMD_EXT_CID &&
-	       rxd->ext_eid == MCU_EXT_EVENT_WA_TX_STAT))
+	if (rxd->ext_eid == MCU_EXT_EVENT_THERMAL_PROTECT ||
+	    rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
+	    rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
+	    rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
+	    rxd->ext_eid == MCU_EXT_EVENT_BCC_NOTIFY ||
+	    !rxd->seq)
 		mt7915_mcu_rx_unsolicited_event(dev, skb);
 	else
 		mt76_mcu_rx_event(&dev->mt76, skb);
@@ -4309,22 +4343,12 @@ int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
 	} __packed req = {
 		.cmd = cpu_to_le32(0x15),
 	};
-	struct mt7915_mcu_wa_tx_stat {
-		__le16 wcid;
-		u8 __rsv2[2];
-
-		/* tx_bytes is deprecated since WA byte counter uses u32,
-		 * which easily leads to overflow.
-		 */
-		__le32 tx_bytes;
-		__le32 tx_packets;
-	} __packed *res;
-	struct mt76_wcid *wcid;
-	struct sk_buff *skb;
-	int ret, len, offset;
-	u16 ret_wcid;
+	int len;
 
 	if (is_mt7915(&dev->mt76)) {
+		if (wlan_idx > 0xff)
+			return -EINVAL;
+
 		req.arg0 = cpu_to_le32(wlan_idx);
 		len = sizeof(req) - sizeof(req.arg2);
 	} else {
@@ -4333,44 +4357,8 @@ int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
 		len = sizeof(req);
 	}
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY) |
-					MT76_MCU_CMD_READ,
-					&req, len, true, &skb);
-	if (ret)
-		return ret;
-
-	offset = is_mt7915(&dev->mt76) ? 0 : 4;
-	if (skb->len < offset + sizeof(*res)) {
-		dev_kfree_skb(skb);
-		return -EINVAL;
-	}
-
-	skb_pull(skb, offset);
-
-	res = (struct mt7915_mcu_wa_tx_stat *)skb->data;
-
-	ret_wcid = le16_to_cpu(res->wcid);
-	if (is_mt7915(&dev->mt76))
-		ret_wcid &= 0xff;
-
-	if (ret_wcid != wlan_idx) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	rcu_read_lock();
-
-	wcid = mt76_wcid_ptr(dev, wlan_idx);
-	if (wcid)
-		wcid->stats.tx_packets += le32_to_cpu(res->tx_packets);
-	else
-		ret = -EINVAL;
-
-	rcu_read_unlock();
-out:
-	dev_kfree_skb(skb);
-
-	return ret;
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY) |
+				 MT76_MCU_CMD_READ, &req, len, false);
 }
 
 int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
-- 
2.47.3

