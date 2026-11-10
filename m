Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336880;
	b=x+7b2KDOGdOp1VT10pBnT5eCWtR6vJW8qxW4mvj6+2M0UlPEEXy8NpLc3IC39ICUue0f
	 HOdC0rawW6v0x7Y7Dfv53aWOHyFdxa2Rl60GsQXbeGlTQD5PkxeVGWH6TDUC88LLATJ3l
	 Gz5GiLrCo8Esj//j/pkAHoTUC0lgQhgx5TvdnphUffnbFB19VdDsjX7NOQrBq4wAvDq2h
	 aZxrcWN0mdXJdxqo7nntn1/fH86r/fH/7mzFPnvoYIPtY+Ob5YLUJcKjolbW3zzb5OtJP
	 3tv0p0BHX6k8YVRqRvs4bd5EAC5wVGs3qWqT0doqjlHkHrwBk2taDWIwNlmHg5IpvRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336880;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0AuXyZ0EApoqk7ejJrVnGO6U1qQ3LpmkSeCvkCyqwAk=;
	b=Tnagl1uS+X5VqW4dvB/SD94hQB9xE9e+gf8eAx4RjSWVy25XsRVm9i4Ah5E/4lpaYYsN
	 TFQPR0gEuiZSWG9zu3wnp8Cxk3KJXpoAwcFm3VxHMvXKrEKSxHjFGnNWMjkGf5HIbW+OT
	 pkboAUyzkHYEI5usKCboKv0kDYRIIJiS8CsVOUZ8og+VwAbbh0rFCAr4cnGDgLSqsoygy
	 0qwcb/yxoCbKsGUO+dBttNbpWRNBDUwjQ33W+RsNdoNMDYB3zA1PZN7ZzMFmqQPzAJpNi
	 gn4T/0DRhYMcv3xxqhr8S2D4euMbP8qgwGwhMu5HbBFv3PttayXw0WxY7E8WUSDN8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=AV2z1pqi;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB5606A323
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABB5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=AV2z1pqi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0AuXyZ0EApoqk7ejJrVnGO6U1qQ3LpmkSeCvkCyqwAk=; b=AV2z1pqilUSREvWdQbqNKc0ZFL
	fq+LVk3THc/3btDH+FiUh8Lqtw0vP8UB5CUsEUJ7CDCiF5D/yrFc7NG+RlHkTFSkC64ZFQSt094bT
	ndo+JtDAZhOY9VreZ58X8pxYjeiEfjfey03K1Mj6pxuZcDmJtdJ2dUU3P98m3NL/aoug=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xQqzO-001EEc-0D;
	Tue, 10 Nov 2026 19:54:38 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: [PATCH wireless v2 1/4] wifi: mac80211: keep the monitor chanreq empty without a channel
Date: Tue, 10 Nov 2026 19:54:33 +0100
Message-ID: <20261110185436.2015505-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

ieee80211_do_stop() releases the channel of a monitor, but leaves its
chanreq filled. When the monitor comes back up it has no channel, yet
the RX path still filters on the old chanreq and drops all frames
received on other frequencies.

Only keep the chanreq filled while a channel is set on the monitor.

Fixes: f92e0cf19ae0 ("wifi: mac80211: filter on monitor interfaces based on configured channel")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
v2: drop unnecessary condition for memset

 net/mac80211/cfg.c   | 5 ++++-
 net/mac80211/iface.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bcea7..64e2bd0cf124 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1165,8 +1165,11 @@ static int ieee80211_set_monitor_channel(struct wiphy *wiphy,
 	ieee80211_link_release_channel(&sdata->deflink);
 	ret = ieee80211_link_use_channel(&sdata->deflink, &chanreq,
 					 IEEE80211_CHANCTX_SHARED);
-	if (ret)
+	if (ret) {
+		memset(&sdata->vif.bss_conf.chanreq, 0,
+		       sizeof(sdata->vif.bss_conf.chanreq));
 		return ret;
+	}
 done:
 	local->monitor_chanreq = chanreq;
 	return 0;
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 63a371c79183..79739b142398 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -758,6 +758,8 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata, bool going_do
 			break;
 
 		ieee80211_link_release_channel(&sdata->deflink);
+		memset(&sdata->vif.bss_conf.chanreq, 0,
+		       sizeof(sdata->vif.bss_conf.chanreq));
 		fallthrough;
 	default:
 		if (!going_down)
-- 
2.47.3

