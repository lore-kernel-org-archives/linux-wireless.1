Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336880;
	b=ex5RzKHt1HTrreXvacwPlG4K1LZ3KvwZz+UD/O7fNuzYVPieAmGqCyGn1SGq9na9DoS0
	 Ew4odQof7mWFD+SJL35dLwzF+4iR2uSbso8Ye3wMr7xg414ThiMcN5deq4kqLZEUUjgeJ
	 ia8S/7swJhwT8fx8DNDDqo6FDfigER90lrfG3UXWvLvY9zjZuJO32Mfqx0UDMX/acnoXh
	 028GvsUwz5J803hJrzJFevBsrr2/FFg0e+f1kZkFz1otMD3S47Z+cYagoOrl/Fnj9edR2
	 oImA/2FbfC9rxLVtECpUonkpTlGeCKX7aUHjl7+zVoqN20Ao5nVc/5tayLZ5wyC53lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336880;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VN4SANnUesjOeOtk2a8FWRrmc7i0LEB55LlUlVnz5LY=;
	b=MnNjEXiKxeVsRqfrVjNX574dCxJYqdtFAz1huyj7HiO14QzJ+Zt4ST7G8xC/1pLdf1X0
	 0B6OKMudXxECvCsBmAIgrZX2iMTbgpXGnRnN8+2j0hbFnC78xUuuT2WJcQsCNnc3L2ZTD
	 ywTdG/3yt5I0vFwaSbbbZEpY32+QB1ttnoI+AZv1Iz8kjoRIXLdQtVbuiMxypdC1Y5ykY
	 qFZ3fioTvYy2KSBP1TptFfdr8IeMQcrvBHXxhgL14wmbzBdwarRXxByzA6r2vm3yqr15n
	 1j6S4e+6qZFOeynghweEfqp70NHz5wdP+bbM3vs8j6beU8VwamHmnPylxI1ysUZrzjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rrfH4dgE;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1A606A33C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E1A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rrfH4dgE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VN4SANnUesjOeOtk2a8FWRrmc7i0LEB55LlUlVnz5LY=; b=rrfH4dgEH5YdyyDV0HI+biyiil
	7lNEh70dF+Iok4X5aoNYnPnb6uXUgPEvpNkRLedAcQbUEs342kPlRKaCzadK1WjcqVqMKm2nCKqjs
	71nZEFAvy0UCmqQfTzYudX4tHMFnsHlMp+KuEiIIHUrvroPr6ER1AfpXDqx3BXtD8jgI=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xQqzO-001EEc-1M;
	Tue, 10 Nov 2026 19:54:38 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: [PATCH wireless v2 3/4] wifi: mac80211: remove real monitors from the driver on suspend
Date: Tue, 10 Nov 2026 19:54:35 +0100
Message-ID: <20261110185436.2015505-3-nbd@nbd.name>
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

