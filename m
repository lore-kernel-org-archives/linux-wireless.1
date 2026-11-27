Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768549;
	b=nuVxpP7tYscyAXviRqI9+3UEI87jf71rjgZ1fGDlq2pGYTdb/DhaM24enSCiq7SDYmaH
	 pqRBWPfBr75VfQGf47UDamPHNkLIEl9zfLODvADMYXeodOfefk43PWsXqZ0AZ8KJ+0EqR
	 nvW9P2aAk5A2F/bm/6yNQdFmbH3B4MzV6oe+t76Dy+wYTAhcD2nxOCyss0sMN8gspMPn6
	 LGA3lG0+AGg1gShV2Adjz/Kreh9qmAy/IoVEyfrvh0NjdL1SESWA1wLOpc3utcLrEoG7M
	 6Tu8D9Zuh/r9VTh17P3sa098b21EdkOvut8tsY5IW6PsO/OpltMac6o6Zy7rS3rUS9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768549;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RFWM4TLyY8Qg0/n8HoWKhj7pMCmkonmy7x84HhTgKCk=;
	b=2bl0UM0W9BpMlTZh/3bZ9mExeFB7JoVFuzKAsA3aLgK8R3ghMt3nSgcEJl9O11D6avdw
	 mkI6epUmMuBYRlG7YXRNziese9Cv7/uTASj+wjyFY/fptge3Ocqrug35TIqGy6l/w/Eyu
	 SWbSasL5jldByVH48ykw0d9HGynXRGrxxHFrg8W6OWykiYyHv5nqNhCJkmQIqUGO1FBq1
	 B6E9px6wKd0nH9rnXINliHgtdx8cCXIMVjPueygwjJ73ZM+OnQ46X7FldGwvTn2+++IH5
	 t6ZybYFw0T6xoLnk4Nhi9GjsV+csS35w2EjMquLCFzbzpD4sgAr8OEVFjU0hnSjJLzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8Qo7URM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F2606A31C;
	Fri, 27 Nov 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8Qo7URM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768549;
	b=Boi+uN21gologXLIxZrvU0SbiF5sRCfgapkHiYCfYkafGshEkK60u+Qjrgu7T0QO7u6w
	 X4Du09S810iMmJSsWn4VAx1w6rl77mW4jDFhNexoOOnaj1XPVRInHD5UTdq2ZB8iD4kX3
	 8X7Aq677tcyUi2XqF7fQQPMDfW8MDTyk9fOO8cp8k4rEL5PanZbor/x0PZuauPX69+3iv
	 S+N0MTavVYFb0GT+FLpo5BuBp1GHaZfk6fwFYfvpQ4EwVNMphMglD+DkqKDdRjMqQIWRR
	 rgubQm/ODn/dbVBaekzNiNY7NfODTbhiocBRy6IBGd/cDuZ+dnvkFhniaPSPveQXZoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768549;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RFWM4TLyY8Qg0/n8HoWKhj7pMCmkonmy7x84HhTgKCk=;
	b=w2dnU0/jqyBKg+CL2tH4g6SsH+wOXTbNBLajI6/Bv7ROx68xy5p3rqgeWS/N7X+cxQNx
	 6ZQxtGBIbJVfrI9mM4bhXYTGy838/08JNvhGwHhq7uUXvVs24wLIxB0MQY6OTwTUpR3Hs
	 QtXkrS543yPKmmYG14WV1Q90qZbiPTL6YkiKth8MADjNGZJNik88tWvPfzzBefSMwlcMq
	 7IyhgipURlzd4wWV4k9dyClIaH7RkIKexqEuq6yAM925zdDu4lxDHDbl5PEcVfNJ0+jBb
	 XLUOY2M5pMr4VI6u5+eYkaxG76WuizD9Y9xeyl87tfg5Ea5NYpbbAo5aMuK1bLNxACQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3E591F008A0;
	Fri, 27 Nov 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768549;
	bh=RFWM4TLyY8Qg0/n8HoWKhj7pMCmkonmy7x84HhTgKCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j8Qo7URMqt7e9OtFRB7J3aawIIqnDIPSPsjxG6Qx7XEPyi+EvtL7b+906xei8Dfv3
	 +EkGoG1OoqGwAWS4HTkK5idFUjJeCBxMNyl7bGDvc0K+UjPdKP48fAKDBJUN94PKkn
	 kCi4SuPu4wb2CnId6hOMRLEA/ZyrPtleIksbxWu3zwQIXMypGQLxpEOVTAIFvkXBqd
	 qC0RLlsp7vZUVuC0xgjEVvGfi0wGGXXG4IR9d37UZ8vETgyb+n6r9O76f5JcpJYVnX
	 dYjCUrDOs7361Q3DUtI6Ma+ACAqVRSCzKxOmaDeymJ9KyB8He1mgnBVUddSBxMVUEF
	 xpDQvovm717rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 187264B652;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:17 +0300
Subject: [PATCH 06/10] wifi: mt76: mt7603: defer WTBL updates when register
 access can sleep
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-6-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=9247;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=Vk5De/9hWLwKs50xfkLnB/Q8/ooC2MK/9jdwGTeu/+0=;
 b=dFnqVPeAvwePEgZztm1nk7KxhGiZZ8zrBdW/YTnRh8JGiFPPcYiDAUaBqTB3iHPwk32NoxeDJ
 DYDH4YwGqGRAryDQ3STvJXIQEdsvlB/+PIAKO1jvFuND8jtKPmdt4w1
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Reply-To: llamapersonaltv@gmail.com
Content-Transfer-Encoding: 7bit

From: Murad Dadashev <llamapersonaltv@gmail.com>

WTBL rate, SMPS and power save updates are issued from atomic context:
under mt76.lock and ps_lock, from the TX path and from mac80211's
sta_rate_tbl_update callback. That is fine with MMIO, but register
access over USB sleeps.

On non-MMIO buses, queue rate updates and apply them, together with
the SMPS setting, from a work item. Record power save transitions per
station and write them from a separate work item. In sta_remove, call
mt7603_filter_tx() outside ps_lock on these buses.

No functional change for MT7603E and MT76x8.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |   4 +
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c    | 136 ++++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c   |  12 +-
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  13 ++
 4 files changed, 156 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index d4d631958c56fc0ee54596c5fed7a983fcf0278b..66b65ec2add7ccdd4d205ee203d10b3d221cae7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -513,6 +513,10 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	dev->mt76.bus = bus_ops;
 
 	spin_lock_init(&dev->ps_lock);
+	spin_lock_init(&dev->rate_lock);
+	INIT_LIST_HEAD(&dev->rate_list);
+	INIT_WORK(&dev->rate_work, mt7603_rate_work);
+	INIT_WORK(&dev->ps_work, mt7603_ps_work);
 
 	INIT_DELAYED_WORK(&dev->mphy.mac_work, mt7603_mac_work);
 	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index fb5e06d04e5a943a4536676fdf7676e6789db6df..efe680d67e4af728dbef32290a55e4279926f532 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -236,17 +236,12 @@ void mt7603_wtbl_set_smps(struct mt7603_dev *dev, struct mt7603_sta *sta,
 }
 
 static void
-__mt7603_wtbl_set_ps(struct mt7603_dev *dev, struct mt7603_sta *sta,
+mt7603_wtbl_write_ps(struct mt7603_dev *dev, struct mt7603_sta *sta,
 		     bool enabled, bool filter)
 {
 	int idx = sta->wcid.idx;
 	u32 addr;
 
-	lockdep_assert_held(&dev->ps_lock);
-
-	if (sta->ps == enabled)
-		return;
-
 	mt76_wr(dev, MT_PSE_RTA,
 		FIELD_PREP(MT_PSE_RTA_TAG_ID, idx) |
 		FIELD_PREP(MT_PSE_RTA_PORT_ID, 0) |
@@ -264,6 +259,55 @@ __mt7603_wtbl_set_ps(struct mt7603_dev *dev, struct mt7603_sta *sta,
 	mt76_rmw(dev, addr + 3 * 4, MT_WTBL1_W3_POWER_SAVE,
 		 enabled * MT_WTBL1_W3_POWER_SAVE);
 	mt76_clear(dev, MT_WTBL1_OR, MT_WTBL1_OR_PSM_WRITE);
+}
+
+void mt7603_ps_work(struct work_struct *work)
+{
+	struct mt7603_dev *dev = container_of(work, struct mt7603_dev,
+					      ps_work);
+	int i;
+
+	mutex_lock(&dev->mt76.mutex);
+	for (i = 0; i < MT7603_WTBL_SIZE; i++) {
+		struct mt76_wcid *wcid;
+		struct mt7603_sta *msta;
+		bool filter;
+
+		wcid = rcu_dereference_protected(dev->mt76.wcid[i],
+						 lockdep_is_held(&dev->mt76.mutex));
+		if (!wcid || !wcid->sta)
+			continue;
+
+		msta = container_of(wcid, struct mt7603_sta, wcid);
+		if (!test_and_clear_bit(MT7603_PS_PENDING, &msta->ps_pending))
+			continue;
+
+		filter = test_and_clear_bit(MT7603_PS_FILTER,
+					    &msta->ps_pending);
+		mt7603_wtbl_write_ps(dev, msta, READ_ONCE(msta->ps), filter);
+	}
+	mutex_unlock(&dev->mt76.mutex);
+}
+
+static void
+__mt7603_wtbl_set_ps(struct mt7603_dev *dev, struct mt7603_sta *sta,
+		     bool enabled, bool filter)
+{
+	lockdep_assert_held(&dev->ps_lock);
+
+	if (sta->ps == enabled)
+		return;
+
+	if (!mt76_is_mmio(&dev->mt76)) {
+		sta->ps = enabled;
+		if (enabled && filter)
+			set_bit(MT7603_PS_FILTER, &sta->ps_pending);
+		set_bit(MT7603_PS_PENDING, &sta->ps_pending);
+		queue_work(dev->mt76.wq, &dev->ps_work);
+		return;
+	}
+
+	mt7603_wtbl_write_ps(dev, sta, enabled, filter);
 	sta->ps = enabled;
 }
 
@@ -751,9 +795,89 @@ mt7603_mac_tx_rate_val(struct mt7603_dev *dev,
 	return rateval;
 }
 
+struct mt7603_rate_desc {
+	struct list_head node;
+	struct mt7603_sta *sta;
+	u16 wcid_idx;
+	bool has_probe;
+	struct ieee80211_tx_rate probe_rate;
+	struct ieee80211_tx_rate rates[4];
+};
+
+static void
+__mt7603_wtbl_set_rates(struct mt7603_dev *dev, struct mt7603_sta *sta,
+			struct ieee80211_tx_rate *probe_rate,
+			struct ieee80211_tx_rate *rates);
+
+void mt7603_rate_work(struct work_struct *work)
+{
+	struct mt7603_dev *dev = container_of(work, struct mt7603_dev,
+					      rate_work);
+	struct mt7603_rate_desc *desc, *tmp;
+	LIST_HEAD(list);
+
+	spin_lock_bh(&dev->rate_lock);
+	list_splice_init(&dev->rate_list, &list);
+	spin_unlock_bh(&dev->rate_lock);
+
+	list_for_each_entry_safe(desc, tmp, &list, node) {
+		list_del(&desc->node);
+
+		mutex_lock(&dev->mt76.mutex);
+		if (rcu_access_pointer(dev->mt76.wcid[desc->wcid_idx]) ==
+		    &desc->sta->wcid) {
+			struct ieee80211_sta *sta;
+
+			sta = container_of((void *)desc->sta,
+					   struct ieee80211_sta, drv_priv);
+			__mt7603_wtbl_set_rates(dev, desc->sta,
+						desc->has_probe ?
+						&desc->probe_rate : NULL,
+						desc->rates);
+			mt7603_wtbl_set_smps(dev, desc->sta,
+					     sta->deflink.smps_mode ==
+					     IEEE80211_SMPS_DYNAMIC);
+		}
+		mutex_unlock(&dev->mt76.mutex);
+
+		kfree(desc);
+	}
+}
+
 void mt7603_wtbl_set_rates(struct mt7603_dev *dev, struct mt7603_sta *sta,
 			   struct ieee80211_tx_rate *probe_rate,
 			   struct ieee80211_tx_rate *rates)
+{
+	struct mt7603_rate_desc *desc;
+
+	if (mt76_is_mmio(&dev->mt76)) {
+		__mt7603_wtbl_set_rates(dev, sta, probe_rate, rates);
+		return;
+	}
+
+	desc = kzalloc(sizeof(*desc), GFP_ATOMIC);
+	if (!desc)
+		return;
+
+	desc->sta = sta;
+	desc->wcid_idx = sta->wcid.idx;
+	if (probe_rate) {
+		desc->has_probe = true;
+		desc->probe_rate = *probe_rate;
+	}
+	memcpy(desc->rates, rates, sizeof(desc->rates));
+
+	spin_lock_bh(&dev->rate_lock);
+	list_add_tail(&desc->node, &dev->rate_list);
+	spin_unlock_bh(&dev->rate_lock);
+
+	queue_work(dev->mt76.wq, &dev->rate_work);
+}
+
+static void
+__mt7603_wtbl_set_rates(struct mt7603_dev *dev, struct mt7603_sta *sta,
+			struct ieee80211_tx_rate *probe_rate,
+			struct ieee80211_tx_rate *rates)
 {
 	struct ieee80211_tx_rate *ref;
 	int wcid = sta->wcid.idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 80dafe89e2c54c1148611b89c7cd65885214463c..ca4f66bde33a668d9f4cff85512a082407eaaf44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -379,9 +379,13 @@ mt7603_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	spin_lock_bh(&dev->ps_lock);
 	__skb_queue_purge(&msta->psq);
-	mt7603_filter_tx(dev, mvif->idx, wcid->idx, true);
+	if (mt76_is_mmio(mdev))
+		mt7603_filter_tx(dev, mvif->idx, wcid->idx, true);
 	spin_unlock_bh(&dev->ps_lock);
 
+	if (!mt76_is_mmio(mdev))
+		mt7603_filter_tx(dev, mvif->idx, wcid->idx, true);
+
 	spin_lock_bh(&mdev->sta_poll_lock);
 	if (!list_empty(&msta->wcid.poll_list))
 		list_del_init(&msta->wcid.poll_list);
@@ -714,8 +718,10 @@ mt7603_sta_rate_tbl_update(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	msta->n_rates = i;
 	mt7603_wtbl_set_rates(dev, msta, NULL, msta->rates);
 	msta->rate_probe = false;
-	mt7603_wtbl_set_smps(dev, msta,
-			     sta->deflink.smps_mode == IEEE80211_SMPS_DYNAMIC);
+	if (mt76_is_mmio(&dev->mt76))
+		mt7603_wtbl_set_smps(dev, msta,
+				     sta->deflink.smps_mode ==
+				     IEEE80211_SMPS_DYNAMIC);
 	spin_unlock_bh(&dev->mt76.lock);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 8559a1ee06cd79a00ec4e382065f24f5180a8a21..6c4836fbd2264288b99b0b6780f66b776a92e930 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -81,8 +81,13 @@ struct mt7603_sta {
 
 	u8 ps;
 	u8 ps_sleeping;
+
+	unsigned long ps_pending;
 };
 
+#define MT7603_PS_PENDING	0
+#define MT7603_PS_FILTER	1
+
 struct mt7603_vif {
 	struct mt7603_sta sta; /* must be first */
 
@@ -110,6 +115,12 @@ struct mt7603_dev {
 
 	u8 tx_ant;
 
+	struct work_struct rate_work;
+	struct list_head rate_list;
+	spinlock_t rate_lock;
+
+	struct work_struct ps_work;
+
 	u32 rxfilter;
 
 	struct mt7603_sta global_sta;
@@ -189,6 +200,8 @@ int mt7603_dma_init(struct mt7603_dev *dev);
 void mt7603_dma_cleanup(struct mt7603_dev *dev);
 int mt7603_mcu_init(struct mt7603_dev *dev);
 int mt7603_load_firmware(struct mt7603_dev *dev);
+void mt7603_rate_work(struct work_struct *work);
+void mt7603_ps_work(struct work_struct *work);
 void mt7603_mcu_fill_msg(struct mt7603_dev *dev, struct sk_buff *skb,
 			 int cmd, int *wait_seq);
 int mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,

-- 
2.47.3


