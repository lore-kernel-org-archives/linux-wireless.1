Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=eMb2JCFwsfhwSFtEvmTr8BSnIZJBQIfcQ4LtBI+UVUpuM2YRUgMDr9uL5UWe90N5nKJh
	 OuUPYJMNUO+8UUiagLkGTBvR39r2aPKKxMxwYlnjebIg2dkmq31Uir1NFzIAphy8DAKet
	 Pz6ux+X33serX90Nk409d9lU5BJNkaizttp9ZW2L2ISeJTytQTNBYHWNvGU2M9knP91A1
	 O0/aVkUbZlyfw16DwN1tfLYP1eFNs8+0Fwg+cXAN4GwADeEc84UnLky1El9n8rgy2MPLL
	 pX7Adlgc2gGC7hORZGu8nClg/rqJ6vjJYIpwr4q2w11weXV/oCk7KuQ6r6AKmh5R4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0AFszxbJqqLJrzohz45yn8oL7A6quIg16F7Kb0kyATk=;
	b=C3cVeKeBtsrtgjGx+qMI98UZp/O5Wew0btpwX2dgcfQdNC17eZAgcyjV+uwDFrgR84rD
	 2Lfp6nbL/mGLGU+a5geG0klAIhdJgmrix4aJmtB3UXcheAF/E3ptrH5ueG0BCImKrPz/t
	 wGpyTzjk/fuYORYB/sJfo9z1dbTjlFll/nD8htFlYY2j0A0QHwpC4laQEjqqbhg/VhHoq
	 m5argywO88zGrkgZe8hhZi/GtkgNJskP5yURh6Me3GH0USEDKrygZk4593BOsu9EfCD6f
	 tdIXTjCUvpFrZ6YATICUoK8z3GUIhyfMEqf0JdIeRRm+02dtfJQ4sSA94539Skj95gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VcZnkWsI;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAA606A690
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DAA606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VcZnkWsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0AFszxbJqqLJrzohz45yn8oL7A6quIg16F7Kb0kyATk=; b=VcZnkWsInO7kX1TKjedxNPXszG
	YI88SiMowSWqEnpDy6ReSVC146aRE7BfZed34TtL+CzlQ6tI9eeJfVZkdIpFPES/mJJ9ZrVQ6nAMR
	eeFvevv+bcvjGBfJ+fefCqsOvUJvCMyD8ZS51oIKJxL1MHakQeyHP4GS/4hfJQ/UZmvM=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-0j
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/20] wifi: mt76: mt7996: resume the radar TX stop at an operating channel set
Date: Mon, 23 Nov 2026 14:49:14 +0100
Message-ID: <20261123134920.154270-15-nbd@nbd.name>
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

After a radar detection the firmware stops the data TX of every BSS of
the band. mt7996_mcu_rdd_resume_tx() lifts the stop only after a
completed channel switch announcement or when the last interface goes
down. A radar hit during a CAC ends with a new channel context and no
CSA. Stations then associate on the new channel, but no EAPOL frame
leaves, and a station interface on the band loses its data as well.

Send the resume when the driver sets the band to an operating channel
where no subchannel is unavailable after a radar detection. The MediaTek
feed sends it at the same place in its channel set. An off-channel set
for a scan or a ROC sends none, since the resume also lifts the station
pause of the firmware scan state. A scan or ROC set on the operating
channel sends it. A failed resume keeps phy->rdd_tx_paused set, so a
later channel set, channel switch or the removal of the last interface
sends it again. A chandef with an unavailable subchannel sends none, so
the band does not transmit on the channel of the hit again.

The test misses the time from the detection event until the mac80211
radar work marks the channel unavailable. The radar work does that after
it cancels the CAC.

Fixes: 45a09251d610 ("wifi: mt76: mt7996: fix the behavior of radar detection")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 5676379b2ca1..65b5012a0017 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -754,6 +754,32 @@ static void mt7996_remove_interface(struct ieee80211_hw *hw,
 	}
 }
 
+static bool mt7996_chan_unavailable(struct ieee80211_channel *chan)
+{
+	return chan && (chan->flags & IEEE80211_CHAN_RADAR) &&
+	       chan->dfs_state == NL80211_DFS_UNAVAILABLE;
+}
+
+static bool
+mt7996_chandef_unavailable(struct wiphy *wiphy,
+			   const struct cfg80211_chan_def *chandef)
+{
+	int center[] = { chandef->center_freq1, chandef->center_freq2 };
+	int width = cfg80211_chandef_get_width(chandef);
+	int i, freq;
+
+	for (i = 0; i < ARRAY_SIZE(center) && center[i]; i++) {
+		for (freq = center[i] - width / 2 + 10;
+		     freq < center[i] + width / 2; freq += 20) {
+			if (mt7996_chan_unavailable(ieee80211_get_channel(wiphy,
+									  freq)))
+				return true;
+		}
+	}
+
+	return false;
+}
+
 int mt7996_set_channel(struct mt76_phy *mphy)
 {
 	struct mt7996_phy *phy = mphy->priv;
@@ -778,6 +804,15 @@ int mt7996_set_channel(struct mt76_phy *mphy)
 	if (ret)
 		goto out;
 
+	if (!mphy->offchannel && mphy->chanctx &&
+	    !mt7996_chandef_unavailable(mphy->hw->wiphy, &mphy->chandef)) {
+		ret = mt7996_mcu_rdd_resume_tx(phy);
+		if (ret)
+			dev_warn_once(phy->dev->mt76.dev,
+				      "failed to resume TX after radar: %d\n",
+				      ret);
+	}
+
 	ret = mt7996_dfs_init_radar_detector(phy);
 	mt7996_mac_cca_stats_reset(phy);
 
-- 
2.47.3

