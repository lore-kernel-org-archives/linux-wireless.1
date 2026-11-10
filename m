Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336880;
	b=bQyqb+xBmZiSF82c1C8c4AC0bwj0Kf1Nh44BaHocQfAg2NMTGl9EbXsJfvFgwq9gNXTf
	 NIMxpvOJTiSJc8wYU9NSrpSZjQZwwDARA2Ibrhmb07rRtrWJB0o+4v7GzaRK/mr/qFb+5
	 RF5OUdJ53z6j7O4UBE/caECVjY4gRszu8MfP6Wo5frU96uu4OAL+UL0+UxEnWzlH2YaSW
	 bDiUae66CCaAxuFpnZ9sYkgFObxxRH7FmOn9HfY26jIbTXfQs60ASydfqlaSxOF9uml4E
	 RdAJvQf4Rie0hqF/J0iAWmxa8isi4XtYKsAjGRBwHh4mjJ9iLAfXf66iVh0PSmk1Ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336880;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5b38H9pugWwDCQmS4R+fRpV9gamA4YhUQvX0fkzwdk=;
	b=EM0iuJ66xKQJx499+8kPWKDuDkBsRs53alLC6xuLjMjoHq6wfrXysPNWqNvN47BF99So
	 PH3liQ1+NVV2Nlg5/tVtvo33TSsheDfS+ZRz+WqpN2TGNQI1XNmvyJpgFpMuAKdDRPhDB
	 32V95AbLg8iMrKu080FAibByPvIW4rwfNkKbJuYDnogmFUz5eV2wMvAQpDxtvW8RYDMR0
	 rz/vBekFotH6GwqVgv7XEe7L9EZCY/7Fg2WTSAMrA7wPv1m25z9g7NOunawA4RUAVK6yT
	 hGDSzk1GaHm4U1WeTb1wG2XxSfnaM3EVXZtiKU2u8LWvgYGGJXvFmnURh1xifCXAhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nn2thALy;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F51606A33D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F51606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nn2thALy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=L5b38H9pugWwDCQmS4R+fRpV9gamA4YhUQvX0fkzwdk=; b=nn2thALywDJf/XxRUwRGHoNSL+
	gIafXhw+33CoPXiM9C4KTDH5KYYFRf4HDVyLnpyjGeS69YqvHyVfzImox9mJq2rU60y1PWWtEaI3V
	0NIAzu912FFZ/C501nk1hbzuPJJeOsxD+XRm4EHWVzTPUQTvuag7pWrTBNhUp2VmaglA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xQqzO-001EEc-1v;
	Tue, 10 Nov 2026 19:54:38 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: [PATCH wireless v2 4/4] wifi: mac80211: reject a monitor channel without a running interface
Date: Tue, 10 Nov 2026 19:54:36 +0100
Message-ID: <20261110185436.2015505-4-nbd@nbd.name>
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

With NO_VIRTUAL_MONITOR, ieee80211_set_monitor_channel() applies the
channel to the interface of the request. While a monitor is running,
nl80211_set_wiphy() can send a request without an interface, and sdata
is then invalid. A request for another monitor that is down triggers
the warning in check_sdata_in_driver().

Reject both requests, since the channel can only be applied to a
running monitor.

Fixes: 9d40f7e32774 ("wifi: mac80211: add flag to opt out of virtual monitor support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/cfg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 64e2bd0cf124..62f8cf88f8f4 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1155,6 +1155,10 @@ static int ieee80211_set_monitor_channel(struct wiphy *wiphy,
 		sdata = wiphy_dereference(wiphy, local->monitor_sdata);
 		if (!sdata)
 			goto done;
+	} else if (!dev) {
+		return -EOPNOTSUPP;
+	} else if (!ieee80211_sdata_running(sdata)) {
+		return -ENETDOWN;
 	}
 
 	if (rcu_access_pointer(sdata->deflink.conf->chanctx_conf) &&
-- 
2.47.3

