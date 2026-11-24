Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=aqHBkTpVIHrmovqLgaPHolOe7kVEZiB0s7M3AbNqAsMzQ42nW605SFQs7f4G5YBNkgFA
	 lgavrmc1E5Imwhpx2Nc9dMlPf4OapQOEvBYCx/294Dn7oWUFRg8HfJoUV073M6xuQH4wK
	 qRwTNFRZRglqK37zAP6+xT0QFGRtXz9TUvWeOR2knmIoBNCjvuIkFy13F+GYjqA8kagvI
	 d6fzj3gk/DZePqtcOAexX8MlvE8a2E4CYqRjYNI4Lx2JS+6RsyWYuQzraPjUTtPKQOpjE
	 XPgVzqn1lqzuRUZZCpjL+bqpSSaHdR98aWNznKE9ghajvcZNclZV7UwsZt/4gIiG/Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Iq55axUD/K4VVXErvDVoTKc76Tw9WciTCEyhsQceeQ=;
	b=VJqtrGCtU2mHD2TNpsLwG1slQcDEjnf7ntWN+2cVKlU8xlKs5Eh7I1pyJbYQ5hfTMLKK
	 6rOO6Gzkd3fD6a+tXb+ZWTyczo9I7PGuYTKBY6oWuQnFQr9qd8KuYEir2uAA50gQGiuZb
	 Ouyb8NmfriWZU1wJDI2MHixjn0d+pmD+wB20IXmOCC1LIuVGokeihotv5OlB/p4W88DBM
	 nSFGGo9mt5knSXpVZkyZY7Sx/64pPb24MS0HtA7Q9OFx4UzSl9A4RJuCIEe/WEHSVod19
	 6kh3MdTIK/xEgcnx+rruD6GUNuFv6WWUCtAszbSSpNOwGCH1I7LNUaCyoEDta5xZMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rpLyeIcH;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C1606A69D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336C1606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rpLyeIcH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3Iq55axUD/K4VVXErvDVoTKc76Tw9WciTCEyhsQceeQ=; b=rpLyeIcHYEPVIG9Lio+i8yLF7W
	JH+0FDb4eLhoBW00BI9qqrQeoH5vVxNFsmNhKzYSThBQKB/l9wzNfnaF9347h2bJ8JTUuyV9m9vWm
	DJrMhCuC/a4LchN/7QMAm/ka6AJKGnSX0iq7BNOLe7jHL2l9sJQXiIpsKl2KEnHlr4sU=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-2H
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/20] wifi: mt76: mt7996: keep the TWT state out of the PS flag
Date: Tue, 24 Nov 2026 09:43:04 +0100
Message-ID: <20261124084309.1981968-15-nbd@nbd.name>
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

The UNI_PS_CLIENT_INFO entry of the PS sync event is the TWT agreement
state of a station, not its power save state. The firmware sends it at
the add of the first agreement of a station and at the delete of the
last one. It sends no event per service period.
mt7996_mcu_rx_ps_sync() writes it into MT_WCID_FLAG_PS, so the PS
throttle holds a TWT station to one frame per AC for the whole
agreement.

Do not write the entry into the flag. Only a station that is not an MLD
gets an agreement. The firmware reports no PS change of such a station
in TWT operation. It gates the air time of the station between service
periods itself.

Clear the flag at the first agreement instead. A flag set before it
would otherwise stay set for the whole agreement. Also ignore a PS enter
of a station with an agreement. The firmware can deliver an enter that
it stored before the agreement after the clear. After the last
agreement, the flag stays clear until the firmware reports the next PS
change. The host does not know the PS state of the station at that
point.

Set the flow in the mask of the station before the add command. The
firmware gates the air time from the add on, and an enter can arrive
before the command returns. If the command fails, remove the flow from
the mask again.

The PS sync event reads the flow mask of a station without the mutex
that its writers hold. Mark the accesses.

Fixes: 2d16caccd278 ("wifi: mt76: mt7996: handle UNI PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 11 ++++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c  |  9 +++++++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 1b133d74c175..6d3061c64e30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2604,7 +2604,8 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 
 		msta_link = container_of(flow, struct mt7996_sta_link,
 					 twt.flow[flow->id]);
-		msta_link->twt.flowid_mask &= ~BIT(flow->id);
+		WRITE_ONCE(msta_link->twt.flowid_mask,
+			   msta_link->twt.flowid_mask & ~BIT(flow->id));
 		list_del_init(&flow->list);
 	}
 	dev->twt.table_mask = 0;
@@ -3413,15 +3414,18 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	}
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
+	WRITE_ONCE(msta_link->twt.flowid_mask,
+		   msta_link->twt.flowid_mask | BIT(flowid));
 	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
 				       MCU_TWT_AGRT_ADD)) {
+		WRITE_ONCE(msta_link->twt.flowid_mask,
+			   msta_link->twt.flowid_mask & ~BIT(flowid));
 		list_del(&flow->list);
 		goto unlock;
 	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-	msta_link->twt.flowid_mask |= BIT(flowid);
 	dev->twt.n_agrt++;
 
 unlock:
@@ -3453,7 +3457,8 @@ void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
 		return;
 
 	list_del_init(&flow->list);
-	msta_link->twt.flowid_mask &= ~BIT(flowid);
+	WRITE_ONCE(msta_link->twt.flowid_mask,
+		   msta_link->twt.flowid_mask & ~BIT(flowid));
 	dev->twt.table_mask &= ~BIT(flow->table_id);
 	dev->twt.n_agrt--;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e129cd2cd73e..3486781609e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2025,7 +2025,7 @@ mt7996_mac_sta_remove(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		if (msta_link->twt.flowid_mask & BIT(i))
 			list_del_init(&msta_link->twt.flow[i].list);
 	}
-	msta_link->twt.flowid_mask = 0;
+	WRITE_ONCE(msta_link->twt.flowid_mask, 0);
 
 	for (i = 0; i < ARRAY_SIZE(msta->link); i++)
 		mt7996_mac_sta_remove_link(dev, sta, i, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 599bc6735c30..91129c1f5a5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -915,12 +915,17 @@ mt7996_mcu_wed_rro_event(struct mt7996_dev *dev, struct sk_buff *skb)
 static void
 mt7996_mcu_ps_transition(struct mt7996_dev *dev, u16 wcid_idx, bool ps)
 {
+	struct mt7996_sta_link *msta_link;
 	struct mt76_wcid *wcid;
 
 	wcid = mt76_wcid_ptr(dev, wcid_idx);
 	if (!wcid || !wcid_to_sta(wcid))
 		return;
 
+	msta_link = container_of(wcid, struct mt7996_sta_link, wcid);
+	if (ps && READ_ONCE(msta_link->twt.flowid_mask))
+		return;
+
 	mt76_sta_ps_transition(&dev->mt76, wcid, ps);
 }
 
@@ -951,12 +956,12 @@ mt7996_mcu_rx_ps_sync(struct mt7996_dev *dev, struct sk_buff *skb)
 		case UNI_PS_CLIENT_INFO: {
 			struct mt7996_mcu_ps_client_info *info = (void *)tlv;
 
-			if (tag_len < sizeof(*info))
+			if (tag_len < sizeof(*info) || !info->ps_bit)
 				break;
 
 			mt7996_mcu_ps_transition(dev,
 						 le16_to_cpu(info->wlan_idx),
-						 info->ps_bit);
+						 false);
 			break;
 		}
 		case UNI_PS_MULTI_CLIENT_INFO: {
-- 
2.47.3

