Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=C88lTaHeHi6L8x1JXU2mQWdJ7A41q34V4DeYZhCxmz/0tQDNEuw56aw8O80zvzO/F1nf
	 HQxIdNBT0kXvmRW5n+XkSKqtW/UAxF/u4UZJa+XBr6ZzFrTgN0L6QYGwWQmaV6l/4kflP
	 7DnOHH6blM9jeK5eYZIECmDu10yaVUzuSE56UsYuOxKg4yNSDoc8kOA+pAHuANWZIq0b9
	 tfTbseAr0mWOiq8BX0a0f2jacneQsuJsbgMs3amQbgCyp4XsHnxBjDrq4v6KJTGrfoTNP
	 mdjGjeR+ixy9FeqhxhdlKIOoKXQ6Dk4KncKt+HP5IyJdLgi/xOX2ucWq8pPwpcR6gpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LsvAPd5LeadStxeSOnLrjV6DOyLRN8DFoNk70pl8YtQ=;
	b=TZjlRtdMiMdSp30OhGae6n32kmXjOOYYuOnn65nhEcg3/hv/mMHb3BqSoq86Ky005Jw7
	 QIK+Ir/od4dy7hXB7onDRalndLDpjlAqc4BNlx6LKi7OdoaPKuUyV2h1ba9kkmjrFastp
	 frziVASNNna4ZnVCcXXfV7WcY51bCVyG0ool/M7pMZ4Zj0t5gOGAcOLWfqB2AwjZWhOnQ
	 fAy/zs0IqWxGKZyYESmI+cJ009cHMCil2+Bx75B5F2wK39AT9VnAfkyeoCE1Xt9NQjSLP
	 34ADZWwsnR09xqJDExafIa8Lf1oz/XaxDPH9u/rNKDJUmk/OGxxM6FrOIwlHqzu3Q9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="DZfqO/JZ";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D9060A2621
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D9060A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=DZfqO/JZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LsvAPd5LeadStxeSOnLrjV6DOyLRN8DFoNk70pl8YtQ=; b=DZfqO/JZEqy/K5CnzxFf8hROWV
	DZRUKgA8tSYPNgpFSaTI3YfqDgF9Tuj/7r1c4UOBmQgPB4hYLNxUJNmcsn9W9zRY0lhgp6a9+Dtw1
	5K+dL5RawPwFjZqANIo+ZNiECJ/KZ+oTqL7JbJIUx8AVRWPckZD/oTxTMpFotLy+Zrhc=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-2J
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/16] wifi: mt76: mt7925: install pairwise keys on station links added later
Date: Wed, 18 Nov 2026 17:18:23 +0100
Message-ID: <20261118161827.1208649-12-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7925_set_key() installs a pairwise key only on the links in
msta->valid_links at the time of the call. mac80211 does not install it
again when a link is added to the station later, because
ieee80211_key_switch_links() only moves keys with a link ID. A link that
mt7925_change_sta_links() adds after the key is installed thus has no
key in its WTBL entry. Reachable via _ieee80211_set_active_links(), for
example when the AP removes all active links of the client with ML
reconfiguration and ieee80211_ml_reconf_work() activates another link.

Install the pairwise keys of the station on the links that
mt7925_change_sta_links() adds, like mt7996_mac_sta_links_set_keys()
does. Stop at the first key that fails and log it: a timed out MCU
command already schedules a chip reset, and each further command can
wait for its own timeout under the wiphy lock. Keep the links and
return success, since ieee80211_sta_set_link_valid() drops a link on an
error without telling the driver.

Fixes: 43aa4033eb18 ("wifi: mt76: mt7925: add mt7925_change_sta_links")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 975c564236f9..b88d92f9aaf2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2597,6 +2597,51 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return err;
 }
 
+struct mt7925_key_iter_data {
+	struct ieee80211_sta *sta;
+	struct mt792x_link_sta *mlink;
+	unsigned int link_id;
+	int err;
+};
+
+static void
+mt7925_sta_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta, struct ieee80211_key_conf *key,
+		    void *data)
+{
+	struct mt7925_key_iter_data *it = data;
+
+	if (it->err || sta != it->sta || key->link_id >= 0)
+		return;
+
+	it->err = mt7925_set_link_key(hw, SET_KEY, vif, sta, key, it->link_id,
+				      it->mlink);
+}
+
+static void
+mt7925_mac_sta_links_set_keys(struct ieee80211_hw *hw,
+			      struct ieee80211_vif *vif,
+			      struct ieee80211_sta *sta, unsigned long links)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt7925_key_iter_data it = {
+		.sta = sta,
+	};
+	unsigned int link_id;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		it.link_id = link_id;
+		it.mlink = mt792x_sta_to_link(msta, link_id);
+		ieee80211_iter_keys(hw, vif, mt7925_sta_key_iter, &it);
+		if (it.err) {
+			dev_err(mt792x_hw_dev(hw)->mt76.dev,
+				"failed to set station keys on link %u: %d\n",
+				link_id, it.err);
+			return;
+		}
+	}
+}
+
 static int
 mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, u16 old_links, u16 new_links)
@@ -2619,6 +2664,8 @@ mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (err < 0)
 		goto out;
 
+	mt7925_mac_sta_links_set_keys(hw, vif, sta, add);
+
 out:
 	mt792x_mutex_release(dev);
 
-- 
2.47.3

