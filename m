Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509796;
	b=lSlIiMgbVf7YDz0e7atxV/cJpPGcPQpXcyUJwz5pPTTH0jY4FjOuQyHDyc28djSHmHlA
	 ESc0NguYrhTfGa8xnHZRxKHP/ala826IolqelLHX8Zob+t5v0DYLUSY0viNJ4tHbFXxCG
	 7voYjkAOSTkfe1yu+CD/9aLPyJlCrQw+Nt4MHTRTCcfmf70vnmb5bCIVYDTuD/trNh7ro
	 zjNwoGm0fm66joBHNeB/rTyQIxjqs5Jh12njdbSR6T7Lft9tVOTYaaMeWb/hnBM9MgaMq
	 OiwXjqopKfiWhjjV5KWwaxNgpT9P/kv712LHxdfWNRL7XIT5zecVGgG9wMIpxYUgOJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509796;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nTmDO+S1XCzLKvPZtmhD0OJJUwRfXV8q/c37pQmQS8Y=;
	b=LW7+ALaBGVTXfq2Vd/cKpe6xKAzCK8v9Q0B8u+OMVMZkF7wnVptZM/JFTkYfswzVeVPt
	 QGGND14UkLJZZGtQ7ia2S2GVKV7pE83goMbmqdvyDvvssmBmL1cjf8QueB2QZ5rg91FMi
	 vubKYg2Nkm/F5o1bago+soU6xNdt/ciXBnawAe7rFhB5Gbn/nS8KgebevBsgMvbVBQEnJ
	 HXoJg5npb5L8D8cZj95HE1ZtdWuji80aey+i7qMAGHp+tbQLDnKI/obOZgI4DCFOR7uJO
	 Gff2gvANsfK7X+5VKUuKypumOI1QmxyEvlAOpHdA9BJujMB1YRuyRITxH1RIALF8aKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=iJVjBfky;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA5606A6B2
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4DA5606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=iJVjBfky
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nTmDO+S1XCzLKvPZtmhD0OJJUwRfXV8q/c37pQmQS8Y=; b=iJVjBfkyrJw9BspbJcL5m/H84d
	IO5I37mHdf4V+88mgIc+vij9Gw5AMrGVt1+nPHZcAsrV+OEhRXsTR2ZUaziYCQBOcSWVL2a3nvRLC
	MK3xD73uf9LuzIc5OY33xNntd2l2E/eNkoD3YVyAaUzFnCWqIK+ijS8LbZX6Jv7DbDOk=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7O-007dJf-0m
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:14 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/20] wifi: mt76: mt7915: keep the TWT state out of the PS flag
Date: Tue, 24 Nov 2026 09:43:07 +0100
Message-ID: <20261124084309.1981968-18-nbd@nbd.name>
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

The firmware also sends the PS sync event from its TWT agreement code.
It sends state 1 when an agreement of a station starts, and state 0
when its last agreement ends. mt7915_mcu_rx_ps_sync() writes that state
into MT_WCID_FLAG_PS.

The host thus holds the TX of a TWT station to the PS limit. That lasts
until the agreement ends or a PS leave clears the flag. The end of the
agreement also clears the flag of a station in power save.

The PS limit is the wrong limit for a station that is not in power
save. The WA firmware of mt7986 and mt7981 applies a frame limit of its
own to the station.

Tell the TWT events from the PS events by their path value. Do not
write the TWT state into the flag.

Clear the flag when an agreement starts. The firmware reports no PS
enter of a TWT station, so a flag set before the agreement could stay
set. This matches what mt7996 does for its TWT state.

Fixes: dc930cf883c8 ("wifi: mt76: mt7915: handle MCU PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 11 ++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 981135c23723..59042d043481 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -430,7 +430,7 @@ mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct mt7915_mcu_ps_notify_v2 *p2 = (void *)skb->data;
 	struct mt7915_mcu_ps_notify *p = (void *)skb->data;
 	struct mt76_wcid *wcid;
-	u16 wcid_idx;
+	u16 wcid_idx, path;
 	bool v2, ps;
 
 	/* the mt7986 and mt7981 firmware send the longer v2 layout */
@@ -443,15 +443,23 @@ mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 		wcid_idx = le16_to_cpu(p2->wtbl_lower) |
 			   (le16_to_cpu(p2->wtbl_higher) << 8);
 		ps = p2->ps_bit;
+		path = le16_to_cpu(p2->path);
 	} else {
 		wcid_idx = p->wtbl_lower | (p->wtbl_higher << 8);
 		ps = p->ps_bit;
+		path = p->path;
 	}
 
 	wcid = mt76_wcid_ptr(dev, wcid_idx);
 	if (!wcid || !wcid_to_sta(wcid))
 		return;
 
+	if (path == MT7915_PS_SYNC_TWT || path == MT7915_PS_SYNC_TWT_MANY) {
+		if (ps)
+			mt76_sta_ps_transition(&dev->mt76, wcid, false);
+		return;
+	}
+
 	mt76_sta_ps_transition(&dev->mt76, wcid, ps);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 456c452e07c1..175136dfafff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -65,7 +65,7 @@ struct mt7915_mcu_ps_notify {
 	u8 wtbl_lower;
 	u8 ps_bit;
 	u8 wtbl_higher;
-	u8 rsv;
+	u8 path;
 } __packed;
 
 struct mt7915_mcu_ps_notify_v2 {
@@ -73,11 +73,16 @@ struct mt7915_mcu_ps_notify_v2 {
 
 	__le16 wtbl_lower;
 	__le16 wtbl_higher;
-	__le16 rsv;
+	__le16 path;
 	u8 ps_bit;
-	u8 rsv2;
+	u8 rsv;
 } __packed;
 
+enum {
+	MT7915_PS_SYNC_TWT_MANY = 0x08,
+	MT7915_PS_SYNC_TWT = 0x80,
+};
+
 struct mt7915_mcu_rdd_report {
 	struct mt76_connac2_mcu_rxd_hdr rxd;
 
-- 
2.47.3

