Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025147;
	b=RuyYAI5h91jV7UvuU51C/vnCRXpUklRtNRXnvOSjcn2LdLGdvFnkxxh//pSB62Off+E5
	 8+eZxYFM+YQwyFYkXiaN3b8JzDny+tHHE54q2Os5QJpOo1z0PVgvb69TQPhmPe/prFwad
	 fNpO0zjx4N24nmoKQWitF4R5b++bDRtNkFGk6uIfpRCPVO/1re7DOt7NKEIFteRWy1beP
	 gnb+SQN8e/jLnNAND1wxshMNtSGbrXNVcUksstybdu3rIMniLSe0K0JTbq8rT3tHWHn7j
	 2qnOOrRMVOFIKP/HoskgBLx2i5N+VxGMblUHD/e+FBki/duov/Hr8KLqd60ynRL/Beg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025147;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=;
	b=NFkjLfaA8rf6KOE71tOQV3E9WiTJa2mTzybkPWTIWyL9B8enAEEfrCb2KzHraS6tjl09
	 5LZ1LH4RCvwxGpRuMqWCFh78kmobLTyQTyvi4l2JqSkHi625byrfPBIZ+yCxNSkn2L7Us
	 nTLNjYpbPWu5bn02NCoJccfjBb8K7TOA2+N/NsjCypzzSoRaHvsx3ZAsW+OpYVAowBU08
	 7k53WUKxBPvz5Ouh6a0G/L8caWmqD/x0Mu2QgEvi/Kk7zIXEBaL13ylddX+LkEwrc1IpL
	 n4lIw/j3tK6R4VJpEaN/lq8NENyD7MjwoemAOyd/zQeK4UzWmCJ/vA9D5iDlPtOjwyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=EB00A7Cs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A32606A31C;
	Wed, 18 Nov 2026 18:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=EB00A7Cs
ARC-Seal: i=1; a=rsa-sha256; t=1795025082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X8jOYmzoCDzFixebPNe8573EPXMAjewONIOcru31+IjbcKqrReSXmKwCWYjm8PSz5dJ649S0ADirLCPu8bFedadaEsCyXJj7QzwsVGoUJG/AdhOaW2J6rTdqhWZd5jkPNCA6JgKXOVUlJ453g/gk2g8ghpODKh+8efAQqiM7TeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025082; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=; 
	b=Cl/5gjCOTFFAKdhQIJk3rE6EKKyrq2v3vbdHsDGkq6WquLnFTIMqm/keBlaYn6ziiY73L5B0IBQDQpAuRpSER8zE9qtDMuBba6254jBnnTxINUvsLkMLqQZmfPg+T90LHDHDGyF8RX5NCZq9tiEvhwfcBq7QvzPx9nX4tNRn3dI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=EB00A7Csc5f/LL95aHMifb1nYAPBknv3jCFovC60j+WReCvUxwrPbgQuTwIhJWfsFFNIUlGidgVZLexvf6hUBXwr97Y/xodYiC/lFvmz/y+HZuTNWbNhPHe19OacIb/cDjbppQ2DWtmAGijt2WeTLME//jXgKpzSnZNcG/xeJfjku5iZsG2ytvl7ecEFyL7TzSzsasDlSAU96bHn4Eieu7fDu/gw9KGU0kaldpe70ZRV5TnhVoFHDyusRBhGAO+fEk1vJ0y+ftkgo+5sOfKYYX/IwlM+dIUV5B8wDmoFU1igw3HqwIQPmF8FpAIYkbudm0UNSuradQHOROGy9yGYGQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025081608599.5961334286889;
	Wed, 18 Nov 2026 10:04:41 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 1/5] wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
Date: Wed, 18 Nov 2026 23:04:31 +0500
Message-ID: <20261118180435.904-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261118180435.904-1-owner@ph4ntom-rev.uz>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

Injecting a raw frame on a passive monitor interface while a station or
AP interface is also up causes a kernel NULL pointer dereference,
because mac80211 has no virtual monitor vif in concurrent mode and
passes a NULL vif to the driver TX path.

Check the vif pointer with vif_to_rtwvif_safe() and drop frames without
a vif.

Fixes: a0e97ae3f332 ("wifi: rtw89: add ieee80211::remain_on_channel ops")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/mac80211.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index c85ea82..7a55fed 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -23,11 +23,16 @@ static void rtw89_ops_tx(struct ieee80211_hw *hw,
 	struct rtw89_dev *rtwdev = hw->priv;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
-	struct rtw89_vif *rtwvif = vif_to_rtwvif(vif);
+	struct rtw89_vif *rtwvif = vif_to_rtwvif_safe(vif);
 	struct ieee80211_sta *sta = control->sta;
 	u32 flags = IEEE80211_SKB_CB(skb)->flags;
 	int ret, qsel;
 
+	if (unlikely(!rtwvif)) {
+		ieee80211_free_txskb(hw, skb);
+		return;
+	}
+
 	if (rtwvif->offchan && !(flags & IEEE80211_TX_CTL_TX_OFFCHAN) && sta) {
 		struct rtw89_sta *rtwsta = sta_to_rtwsta(sta);
 
-- 
2.56.0.windows.4

