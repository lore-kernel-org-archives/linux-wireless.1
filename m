Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336881;
	b=gJC1G6aPgDbV5e3v10XX+7+1l2AsF1pI4LJn17oEq457TUl+n7EQrrMiF48MQbLsy7gc
	 W1GSNFXSCtVQilC2i2HsvW2TJBteJtB20nAJmQbNCWA5QEfJ5Sgis07VzCXcTwdbFkIpQ
	 oLCnGvFcOh+diNcptwo8sCroKxSz1gZeu0JfepGz9aMThhnwNNSV8/75pK6gat3j5ApdT
	 Ok2kJYcFNS01C6ha/LZB0nsIEfKtakSjDoeRRmCzogGlaDI8WqiQHD1y6j/mvX/qhq792
	 gInUwNC0o06ZkjQV1cmPpis52bJjRdiHhrKJbwcg9jd8i0qzO1sEfizVFL4qGwU84vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336881;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hoPbrOMkwsTh2laEr85ChD0yFiynEO2KIqeuH56eifI=;
	b=4iLZyikP4L/I/WHAdE7cRupzvujjthjRUtjIBbSls+fe50YBW6DAoX2iwbOuR7CwwYg0
	 tJVweAZagNmZKrqNJsbG/7yoK0GWwABbveWBIYgzMj56dNECArKDyLsT11sqFevkVK9gL
	 F2NPV1L1QDnIJVKaBnpR2MT3DtAoq/GOLpO8/lgjCTHMimOhQQQ2/1srigHSFdeXgVFso
	 KiMPYcRzyXXvCj5zvvPLf+hBYaYa278JLxBCi7pvwh65U01ZE35WNcRXlzC0FDPkE9G1z
	 KJhJTlpeLnFK+dW9+SzJ6fPts8SU7PMku3xUbBdkP2xBUKX4H8FXvZibYhQG4FB6k5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=StyGOOgj;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB1606A33B
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACB1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=StyGOOgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hoPbrOMkwsTh2laEr85ChD0yFiynEO2KIqeuH56eifI=; b=StyGOOgj2Ry7cSnDQR7TaLQ9fR
	vgRRV8vfOsKFl19w1x1KDX/2CE7/ueltogw7NHQkQxKlezz9R+cN9+3zxVAZzELDUymp34Ghwe6ih
	xuN1hJ1TkybAoDGMrPXl872hKXqrQ7VcE6u7CISgY3bPHaP7WKyAWUYUkBYtS3VREn5o=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xQqzO-001EEc-0n;
	Tue, 10 Nov 2026 19:54:38 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: [PATCH wireless v2 2/4] wifi: mac80211: release monitor channels on suspend
Date: Tue, 10 Nov 2026 19:54:34 +0100
Message-ID: <20261110185436.2015505-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110185436.2015505-1-nbd@nbd.name>
References: <20261110185436.2015505-1-nbd@nbd.name>
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

A monitor with its own channel keeps its channel context across
suspend, which triggers the warning in __ieee80211_suspend() about
remaining channel contexts.

Release the channel on suspend and acquire it again on resume, like for
the virtual monitor.

Fixes: 9d40f7e32774 ("wifi: mac80211: add flag to opt out of virtual monitor support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/pm.c   |  2 ++
 net/mac80211/util.c | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/net/mac80211/pm.c b/net/mac80211/pm.c
index f63676c44853..de0d7b093520 100644
--- a/net/mac80211/pm.c
+++ b/net/mac80211/pm.c
@@ -151,7 +151,9 @@ int __ieee80211_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan,
 			continue;
 		switch (sdata->vif.type) {
 		case NL80211_IFTYPE_AP_VLAN:
+			continue;
 		case NL80211_IFTYPE_MONITOR:
+			ieee80211_link_release_channel(&sdata->deflink);
 			continue;
 		case NL80211_IFTYPE_STATION:
 			ieee80211_mgd_quiesce(sdata);
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb80274c6..34402200baec 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1748,6 +1748,30 @@ static void ieee80211_assign_chanctx(struct ieee80211_local *local,
 	}
 }
 
+static void ieee80211_reconfig_monitors(struct ieee80211_local *local)
+{
+	struct ieee80211_sub_if_data *sdata;
+
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	list_for_each_entry(sdata, &local->interfaces, list) {
+		struct ieee80211_chan_req chanreq = sdata->vif.bss_conf.chanreq;
+
+		if (sdata->vif.type != NL80211_IFTYPE_MONITOR ||
+		    !chanreq.oper.chan ||
+		    rcu_access_pointer(sdata->deflink.conf->chanctx_conf))
+			continue;
+
+		if (!ieee80211_link_use_channel(&sdata->deflink, &chanreq,
+						IEEE80211_CHANCTX_SHARED))
+			continue;
+
+		sdata_info(sdata, "failed to restore monitor channel\n");
+		memset(&sdata->vif.bss_conf.chanreq, 0,
+		       sizeof(sdata->vif.bss_conf.chanreq));
+	}
+}
+
 static void ieee80211_reconfig_stations(struct ieee80211_sub_if_data *sdata)
 {
 	struct ieee80211_local *local = sdata->local;
@@ -2382,6 +2406,8 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 	    local->virt_monitors == local->open_count)
 		ieee80211_add_virtual_monitor(local, NULL);
 
+	ieee80211_reconfig_monitors(local);
+
 	if (!suspended)
 		return 0;
 
-- 
2.47.3

