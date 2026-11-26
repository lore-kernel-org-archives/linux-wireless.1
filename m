Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=3TSFhLCpW7Oz3/pDLcjbH5isPPh1bdP/NDroZ/UOUyAYsqQEBCc+sBzWKfgf6h+WSOAV
	 O5aBRfqJjvW0DQ0ujUuljfyHZuRiLcKd12lMt/AWkg6OqRbRMUqJVCI8Eg7D+k4oEvGQo
	 R1oX+jBu5RgD17UhkZ4KpvvPFqqewPHDlr/Uhxf4FOnjp60p1VNRCSfOuxi8ZK2JWfKpA
	 rg54sj64Zqgcjak7E2QJRrFGpHL8YLNtjgwn6lPl+TZvp3k00hKtZlWtP0g36h8K/TrQ7
	 pECmuRnxg0j898LEBE2wBwHBQbDViICNlNSNzQyZx/DCgDGJYSGtRGZZNeWdDolraUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JfCFYfgPd3cnQpBJDpsNuIIi+GvdwpjRQb3EYcyPrK0=;
	b=i1vTMGzrz2JDFsjKgrYJz1qiuh/H3Pic8L0Z2FgCtJFBKltHo2dYrNA0fxSZx4D82IrB
	 +06yHPLHKajQV80LA7sj8xXxcYR3NBBEDff889JAB1TimK464x4vunGvJ3+3lv1lRj18y
	 hPtGZKwMlJqfwDc5RDBUGOD+jNozxdziDbhZ6WaeoAhg8DjRiU04IUETWV5JILRU2Mqvc
	 8X1CS+dY8snprWdDR/ixdNbcP60O635+w/oOfgK+a3CqRJLZvTljZrfs51SkcrRdImLSK
	 sRgTExuZILMJxOMZZlAV6bSyaCtevnlXJ3t4EMWkAW6BgQ256UdDPqdr+4p7CXfOS0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ndnCz7wN;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38097606A327
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38097606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ndnCz7wN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JfCFYfgPd3cnQpBJDpsNuIIi+GvdwpjRQb3EYcyPrK0=; b=ndnCz7wNjOlyzs9CxZN8jdo2Ke
	OT90PwvDl3rjDhlGaTGeWrnehVh/5wCw3RrZLMV6DR7Zu2W+fnBzCyRiPKQb2An7tQV41CE+X/FB7
	pN/hKtncG9MFCEelVPifgM979bO1R3yBaCqNvNb1m4/mbcllDXONSRFkI7RJlSsXHydE=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-2J
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/16] wifi: mt76: keep an RX replay counter per group key id and TID
Date: Thu, 26 Nov 2026 19:23:15 +0100
Message-ID: <20261126182325.2516607-6-nbd@nbd.name>
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

Where mt76 strips the IV of a decrypted frame, mac80211 leaves its PN
check to mt76_check_ccmp_pn(). That function uses per-TID counters that
all keys of the wcid share. After a GTK rekey, frames of the new key
thus read as replays until their PN passes that of the old key.

Keep counters per group key id and TID in the vif link of a station
interface, and check a group addressed frame that a driver marks with
its key id against them. Other interface types need none: an AP receives
nothing under its own group key, and each IBSS or mesh peer has a group
key of its own. All other frames keep the per-TID counters of their
wcid, so that each driver can move to the new counters on its own.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 95 ++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt76.h     | 26 ++++-
 2 files changed, 97 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index a42a950c20cb..33f2bd5a25f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1292,33 +1292,58 @@ int mt76_get_survey(struct ieee80211_hw *hw, int idx,
 }
 EXPORT_SYMBOL_GPL(mt76_get_survey);
 
+static void
+mt76_key_rx_pn_get(struct ieee80211_key_conf *key, int tid, u8 *pn)
+{
+	struct ieee80211_key_seq seq;
+
+	ieee80211_get_key_rx_seq(key, tid, &seq);
+	if (key->cipher == WLAN_CIPHER_SUITE_GCMP ||
+	    key->cipher == WLAN_CIPHER_SUITE_GCMP_256)
+		memcpy(pn, seq.gcmp.pn, sizeof(seq.gcmp.pn));
+	else
+		memcpy(pn, seq.ccmp.pn, sizeof(seq.ccmp.pn));
+}
+
+static void
+mt76_wcid_group_key_setup(struct mt76_wcid *wcid,
+			  struct ieee80211_key_conf *key)
+{
+	struct mt76_rx_group_pn *group_pn = wcid->rx_group_pn;
+	int i;
+
+	if (!group_pn || key->keyidx >= ARRAY_SIZE(group_pn->pn))
+		return;
+
+	if (!mt76_key_has_rx_pn(key)) {
+		group_pn->key_mask &= ~BIT(key->keyidx);
+		return;
+	}
+
+	for (i = 0; i < IEEE80211_NUM_TIDS; i++)
+		mt76_key_rx_pn_get(key, i, group_pn->pn[key->keyidx][i]);
+
+	group_pn->key_mask |= BIT(key->keyidx);
+}
+
 void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
 			 struct ieee80211_key_conf *key)
 {
-	struct ieee80211_key_seq seq;
-	u8 *pn;
 	int i;
 
+	if (key && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		mt76_wcid_group_key_setup(wcid, key);
+
 	mt76_wcid_key_link_setup(wcid, key);
 	if (!key || !mt76_key_has_rx_pn(key))
 		return;
 
-	if (key->cipher == WLAN_CIPHER_SUITE_GCMP ||
-	    key->cipher == WLAN_CIPHER_SUITE_GCMP_256)
-		pn = seq.gcmp.pn;
-	else
-		pn = seq.ccmp.pn;
-
 	/* data frame */
-	for (i = 0; i < IEEE80211_NUM_TIDS; i++) {
-		ieee80211_get_key_rx_seq(key, i, &seq);
-		memcpy(wcid->rx_key_pn[i], pn, sizeof(wcid->rx_key_pn[i]));
-	}
+	for (i = 0; i < IEEE80211_NUM_TIDS; i++)
+		mt76_key_rx_pn_get(key, i, wcid->rx_key_pn[i]);
 
 	/* robust management frame */
-	ieee80211_get_key_rx_seq(key, -1, &seq);
-	memcpy(wcid->rx_key_pn[i], pn, sizeof(wcid->rx_key_pn[i]));
-
+	mt76_key_rx_pn_get(key, -1, wcid->rx_key_pn[i]);
 }
 EXPORT_SYMBOL(mt76_wcid_key_setup);
 
@@ -1411,13 +1436,25 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	*hw = mt76_phy_hw(dev, mstat.phy_idx);
 }
 
+static u8 *
+mt76_rx_group_pn(struct mt76_rx_status *status, int security_idx)
+{
+	struct mt76_rx_group_pn *group_pn = status->wcid->rx_group_pn;
+
+	if (!group_pn || !(group_pn->key_mask & BIT(status->key_id)))
+		return NULL;
+
+	return group_pn->pn[status->key_id][security_idx];
+}
+
 void mt76_check_ccmp_pn(struct sk_buff *skb)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct mt76_wcid *wcid = status->wcid;
 	struct ieee80211_hdr *hdr;
-	struct mt76_wcid *pn_wcid;
 	int security_idx;
+	bool group;
+	u8 *rx_pn;
 	int ret;
 
 	if (!(status->flag & RX_FLAG_DECRYPTED))
@@ -1429,12 +1466,10 @@ void mt76_check_ccmp_pn(struct sk_buff *skb)
 	if (status->skip_pn_check)
 		return;
 
-	if (!wcid || !wcid->rx_check_pn)
+	if (!wcid)
 		return;
 
-	/* the links of an MLD peer share one PN space per key */
-	pn_wcid = mt76_wcid_primary(wcid);
-
+	group = status->group && wcid->rx_group_pn;
 	security_idx = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
 	if (status->flag & RX_FLAG_8023)
 		goto skip_hdr_check;
@@ -1450,6 +1485,10 @@ void mt76_check_ccmp_pn(struct sk_buff *skb)
 			return;
 	}
 
+	/* group state has no counter for Management frames */
+	if (ieee80211_is_mgmt(hdr->frame_control))
+		group = false;
+
 	/* IEEE 802.11-2020, 12.5.3.4.4 "PN and replay detection" c):
 	 *
 	 * the recipient shall maintain a single replay counter for received
@@ -1461,15 +1500,25 @@ void mt76_check_ccmp_pn(struct sk_buff *skb)
 		security_idx = IEEE80211_NUM_TIDS;
 
 skip_hdr_check:
+	/* the links of an MLD peer share one PN space per pairwise key */
+	if (group)
+		rx_pn = mt76_rx_group_pn(status, security_idx);
+	else if (wcid->rx_check_pn)
+		rx_pn = mt76_wcid_primary(wcid)->rx_key_pn[security_idx];
+	else
+		return;
+	if (!rx_pn)
+		return;
+
 	BUILD_BUG_ON(sizeof(status->iv) != sizeof(wcid->rx_key_pn[0]));
-	ret = memcmp(status->iv, pn_wcid->rx_key_pn[security_idx],
-		     sizeof(status->iv));
+	BUILD_BUG_ON(sizeof(status->iv) != sizeof(wcid->rx_group_pn->pn[0][0]));
+	ret = memcmp(status->iv, rx_pn, sizeof(status->iv));
 	if (ret <= 0) {
 		status->flag |= RX_FLAG_ONLY_MONITOR;
 		return;
 	}
 
-	memcpy(pn_wcid->rx_key_pn[security_idx], status->iv, sizeof(status->iv));
+	memcpy(rx_pn, status->iv, sizeof(status->iv));
 
 	if (status->flag & RX_FLAG_IV_STRIPPED)
 		status->flag |= RX_FLAG_PN_VALIDATED;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 688039f2d967..e2156d7c1108 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -383,6 +383,11 @@ DECLARE_EWMA(signal, 10, 8);
 #define MT_WCID_TX_INFO_TXPWR_ADJ	GENMASK(25, 18)
 #define MT_WCID_TX_INFO_SET		BIT(31)
 
+struct mt76_rx_group_pn {
+	u8 key_mask;
+	u8 pn[4][IEEE80211_NUM_TIDS][6];
+};
+
 struct mt76_wcid {
 	struct mt76_rx_tid __rcu *aggr[IEEE80211_NUM_TIDS];
 
@@ -410,6 +415,7 @@ struct mt76_wcid {
 
 	u8 rx_check_pn;
 	u8 rx_key_pn[IEEE80211_NUM_TIDS + 1][6];
+	struct mt76_rx_group_pn *rx_group_pn;
 	u16 cipher;
 
 	u32 tx_info;
@@ -782,7 +788,8 @@ struct mt76_rx_status {
 		} eht;
 	};
 
-	u8 amsdu:1, first_amsdu:1, last_amsdu:1, skip_pn_check:1;
+	u8 amsdu:1, first_amsdu:1, last_amsdu:1, skip_pn_check:1, group:1,
+	   key_id:2;
 	u8 rate_idx;
 	u8 nss:5, band:3;
 	u8 chains;
@@ -860,6 +867,7 @@ struct mt76_vif_link {
 	struct ieee80211_chanctx_conf *ctx;
 	struct mt76_wcid *wcid;
 	struct mt76_vif_data *mvif;
+	struct mt76_rx_group_pn rx_group_pn;
 	struct rcu_head rcu_head;
 };
 
@@ -1655,6 +1663,22 @@ mt76_wcid_key_link_setup(struct mt76_wcid *wcid,
 	wcid->rx_check_pn = key && mt76_key_has_rx_pn(key);
 }
 
+static inline void
+mt76_wcid_rx_group_pn_set(struct mt76_wcid *wcid, struct ieee80211_vif *vif,
+			  struct mt76_rx_group_pn *group_pn)
+{
+	wcid->rx_group_pn = vif->type == NL80211_IFTYPE_STATION ? group_pn : NULL;
+}
+
+static inline struct mt76_wcid *
+mt76_rx_group_wcid(struct mt76_wcid *wcid)
+{
+	if (!wcid || wcid->sta || !wcid->rx_group_pn)
+		return NULL;
+
+	return wcid;
+}
+
 void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
 			 struct ieee80211_key_conf *key);
 
-- 
2.47.3

