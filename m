Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980020;
	b=ZnDiVY9mWJEjSghQoJl0pvgQobIaIYT6ka44l50X3HNiYsCWI7G8k4VSLqEUaArA1spH
	 mcDYeSt4pkzXXGQNNnofXjGmRlGoLZCk2VQuMKpRopj39F0d3Svr3MyL/aPx2tKgyF5Vf
	 kJTBVLYCewEsEK9g7oeQoXl83NpsJfVkTn6ixV+HbCFRR0kcIAc+wclSySdHN8EwSWddv
	 dNygDEFhPZ6PwoIsTx8whb8Ml3bqZSUWp8yfh8okFlEQwYbwTSKJG7i50J0ZCGb78XSxM
	 yIToLkelpwqu3/092TgWwIXxh32NWFCqjg8gY1EP8AaH2Cv8Tz1dx7cgMqvocGJTi5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980020;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VN4SANnUesjOeOtk2a8FWRrmc7i0LEB55LlUlVnz5LY=;
	b=YP5dD5tg7Np0DOvO2UEDsvnVTn0xY/WtnUNJAA31v0IVC/Ol7jCd4eUn/WjsksBivmU7
	 mEWJQqeEcvE8zdH5hZpLMq6dEQoO++t8fY0mYZijI9HfMZcRDFCxH+eI1oxuZ4icAwzRu
	 xa9Cioc8tLHVlZ12/omYj18VceZBf/pedRICIs2RcxbE4G/rRj1swDV8+5no885LNpyw9
	 VIqOWbC3jfWdSHcwkfc/J1Cpu1O9Ru40Gcz/JLSa/+54KgCpRi8E7MD1nTzoI5qxkjJTo
	 nzEmGynL6R2nKcgM6RczK4ucnj0IQSEHyXGwL38XyAOdMOdupCA6TepbHCNNcImWUEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tMKAMLKp;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD387606A32D
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 15:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD387606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tMKAMLKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VN4SANnUesjOeOtk2a8FWRrmc7i0LEB55LlUlVnz5LY=; b=tMKAMLKp3G14csAKj2A4/p1Tr+
	xvWdsk7DM8Q2DpXlGV6b0FbTVm9wsMz0Ifh6Plol4+zoXLRQ1XmIdbGe67UeIdgO1XcCMgDEU+YCB
	CIzK0P3Tgfz38eCDUmjTbkg8sZ16IdGqA0hh9gRUZ/iPDLgHQS9MZhJ2WWdJbVHtf00Y=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xPM9T-00GvLl-0t;
	Fri, 06 Nov 2026 16:46:51 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: [PATCH wireless 3/4] wifi: mac80211: remove real monitors from the driver on suspend
Date: Fri,  6 Nov 2026 16:46:47 +0100
Message-ID: <20261106154648.1228594-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106154648.1228594-1-nbd@nbd.name>
References: <20261106154648.1228594-1-nbd@nbd.name>
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

With NO_VIRTUAL_MONITOR, ieee80211_reconfig() adds running monitors to
the driver on resume, but __ieee80211_suspend() does not remove them.
Each resume without WoWLAN thus adds an interface that the driver
already has.

Remove these monitors on suspend, like all other interfaces that
ieee80211_reconfig() adds.

Fixes: 9d40f7e32774 ("wifi: mac80211: add flag to opt out of virtual monitor support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/pm.c b/net/mac80211/pm.c
index de0d7b093520..24989ded2830 100644
--- a/net/mac80211/pm.c
+++ b/net/mac80211/pm.c
@@ -154,7 +154,9 @@ int __ieee80211_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan,
 			continue;
 		case NL80211_IFTYPE_MONITOR:
 			ieee80211_link_release_channel(&sdata->deflink);
-			continue;
+			if (!ieee80211_hw_check(hw, NO_VIRTUAL_MONITOR))
+				continue;
+			break;
 		case NL80211_IFTYPE_STATION:
 			ieee80211_mgd_quiesce(sdata);
 			break;
-- 
2.47.3

