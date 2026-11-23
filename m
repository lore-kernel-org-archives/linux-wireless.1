Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441815;
	b=GAaGdbA5Ne9Yzo/wmU80GrN0AgXI4ehz+3Et9RBdJ/2e3/8LmpkXcLMfmtGglsPxEhK1
	 qTccy8R7zpz9w5zowO3rFthgaOM6XZA8PeNCaMCw3gvnd4olM6HX6lNM0pp3VJIr9JwQH
	 jUGy/CxNpIWcPau5sxkQ1bvVpWTsndVyTUF3jzy+hOx3pDOjxnLRrtGZS7qGEl+YU9Wbk
	 o8DFKyPtBWE81u+b8R05Xy7rNIgbAro8H1bZD58Q4Nq+UxICXtCytv5JggpRDZfdYT7P9
	 L16xc76byiP6gEfOIhiAy5Q1wT7JHAQ2q4jMq7NKVJM9eeyJCA0Gc5QSQRbHi8uG4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
	b=YJxEaEX9JQlhFBGbB4Wmyk6pRuHWcuCipFYFkFUDS8y/bXTV0yJv5M3EYqG3f0cOcbvX
	 /qfqUXepnim9NpasDOHFl/89Et3ZJOTjxvvydax7CE7Hm9IHOOKVGSuo8kRdndOhKFmKW
	 gb2p5P3effjcJdUP3epe5D4MJV70H5CVmSrVli0X1RUHUFXtjJXzzuYP3il+JYRAl4YqK
	 g9b70GUyfsxiewIWZPUOw7C2xBKf1GvkVymGWVW4CJH9z7pAERjHkwj5QVwM9jG5hpn/7
	 9+OZ1S0x6YrGNmGGio6ASo3aT1Nte+TkxoGv3zhj3rw91Pt7fC4EbnTu+kl1ZPr+sHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RmovXTm3;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB29606A682
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB29606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RmovXTm3
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so3837745a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441814; x=1796046614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=RmovXTm3yp0/TLqARLhMhmLh4CGdmjeVEHYVnbBhSuhN0ZcZmgmvAj8cQR+WTNev+l
         sER9u4Q54v7YbgeqZviRJKPczKQxCz7J2A2hjkaFNkF29cvcyBNiPEFL46f0vw234XwH
         0A8r7BJRfuCcUpw1E4MoC1vzpMYkPzOBTwNZbIl4oZQrfva3r4JrI9FgTxJZruzkyVmP
         HIR68rHtHZstVmJ9r4wXDoZWtf1FmJtW3iCo0dK6Le5IR2VjMozMF+yQpQXIK3hmC14+
         eMHH6iQk+zIuyFyqKaYsCKfgTDr+ofr/XBHUZ3iCySlFCWN7PotFzre4g35xB5vZ4c9s
         W/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441814; x=1796046614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=cNTPzrnTg9XdG/rikOaC+COhsw0mbyGBB5coJdSdi5NR5oqOr0CwcdsIdmfRd5IfSf
         jI7IBwG9ge01/WnX99DX+rS0HhtIq8aymP6cyrb0OM6YWiglbkUTGcPGLpVSmOWSC+cM
         k/c8kasoMZZS9xcyFuN8uWlxDNzehZtp4zWbVl53XtzMt6oxyPCchIKSq6GxB06obeLP
         3uD53nSGqIhIpeaXEj+RJF5/Dx3yKXh1vIjdqYritUK/eupO7snMat6u17lvVrGqoJ0k
         cIShxvDNBD/elOUbg+gtr0Hw0TFU4LCceMcbA4EiFApa4wd5VttPrI92cPbe479lPF5r
         SgTg==
X-Forwarded-Encrypted: i=1; AL+hErHIe7R8bAxejlHwTkc0xgWbuW43AoiaWR3rqKb5lEvTGa+FhOeyeNDWxYfjIssesjn4hVLHWO24bntbBWUaZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pzkO/7nG9OQHvA9/Ogb8pCJCD3BUZUxcq7tXc9KEEwE3a9aE
	n0uXj4NE3ytHMfvD1bzvOoGstuewKZFYjhxQKJeZLhxkIQKWI86YO1E4xW1r7921+Q==
X-Gm-Gg: AZFdTZere8Ty013JXhU2tPOPpXMsRwnDw7zArgd0wW680egsfPJi0z0FiHOqsUPtsdX
	G3LNhrI2E0OZV2JIdWx/dfribO662Ixfb2Gm7fF5973LqHATYavClbOjON1S5sRvWSSF6JiqJ2U
	p8T5BSDGuOpqZABiuKQKL/8ff92tIzeXULxGDqto92UDSSyIJrJ/SpvMVLzToFeGf16G2xKEg5C
	WOrdOVsX5yac90jztEGzPg7Ex0A1NMkHGQxTo1K5eXPMFSXdwD8Zq7/3piYpGxkJDAcxKC40jhf
	FZDyeDdafQfeIG9qF7ErfkE+ewz+O4iFU2RTByo1XaQuEOizUFtcyvT6BHpqxY8DBCMkPhDLGup
	+//3lzmn0etFSTJcQfQ85okJE469zO0Saiip5wlvZXjgPWGMNigR9I9B9723c1ctoPm/BibgWXS
	TeY+D5szfktaRyjmIkT/9NKk/pyeaDC2gJU0AQ2yMho7C227+8J1jhF6qxEzzkLuPKZNjtNdVqX
	VJNZGEUg0sDM6x5yOk3w87bzv9058QaOJN8gzhQLNi4TV+Hmt8bZaoMj2Tn6dYKOKMWdaXLlRXp
	QDf/JlUzlYvDVgZ93oxd7HGZ7DXTWdMOCgoa8Wn+joUXv1Rc/FhcMTXsVTvWb4Y6uOO57MorX7x
	NvlN2400u248MbrgaAnYqiH0Yu22Uhn0BbctfD7xtONFfzoEJOZMZu9DolxQsdp3/2Mgf9AFLGn
	HD9cYV67wh77z1m+67qW2wTZIg14Rftu7olLMwAFx3qHw8T8VZtK+lrWvJGKcO6a/gJZbAjPv6B
	thJ4EyhQsC2vDPv135poq3tHK2vorwyiGJugS9Vq86cGBg9UNPmAIlTVPqKwrAtCLWUEZtSvutY
	q12XikcSb3Xg4eTp6orM2UfgNm3idBjvI0Nqas+ozVCIiC+HvlBI3nrjUhqwFK9yfINMJiaCeQ=
	=
X-Received: by 2002:a05:6402:1f0b:b0:6b5:87cb:d8ce with SMTP id 4fb4d7f45d1cf-6ba37edf001mr8720032a12.41.1795441813634;
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 2/3] wifi: mac80211: tell a driver the netdev a station's 802.3 frames reach
Date: Mon, 23 Nov 2026 14:50:09 +0100
Message-ID: <20261123135010.721107-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
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

A driver that merges the received frames of a station as GRO on the
netdev would has to know that netdev: whether GRO is on there, whether
it builds frame lists, and which host sockets it looks up. The netdev
is not the vif's for a station on an AP_VLAN interface, and only
mac80211 knows which one the frames reach: the device of the station's
fast_rx, which __ieee80211_rx_handle_8023() delivers them to and drops
them without.

Add ieee80211_sta_rx_netdev(), which returns that device under RCU, or
NULL while the station has no fast_rx.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 17 +++++++++++++++++
 net/mac80211/rx.c      |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 76ff86ff9974..3c6784ad62c7 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5472,6 +5472,23 @@ void ieee80211_rx_napi(struct ieee80211_hw *hw,
 		       struct ieee80211_link_sta *link_sta,
 		       struct sk_buff *skb, struct napi_struct *napi);
 
+/**
+ * ieee80211_sta_rx_netdev - the netdev the 802.3 frames of a station reach
+ * @sta: the station
+ *
+ * A frame the driver hands over with %RX_FLAG_8023 for @sta enters the stack
+ * on this netdev: the station's AP_VLAN interface if it is on one, else the
+ * interface of its vif. A driver that prepares such frames for the receive
+ * path of the netdev, as merging them the way its GRO would, reads the
+ * netdev's settings from it.
+ *
+ * Must be called under RCU; the netdev may be used until the read side
+ * critical section ends.
+ *
+ * Return: the netdev, or %NULL while frames of @sta take no 802.3 path.
+ */
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *sta);
+
 /**
  * ieee80211_rx - receive frame
  *
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index fd7dbd4b0611..397f5fc71a1b 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5310,6 +5310,15 @@ static bool ieee80211_prepare_and_rx_handle(struct ieee80211_rx_data *rx,
 	return true;
 }
 
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *pubsta)
+{
+	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
+	struct ieee80211_fast_rx *fast_rx = rcu_dereference(sta->fast_rx);
+
+	return fast_rx ? fast_rx->dev : NULL;
+}
+EXPORT_SYMBOL(ieee80211_sta_rx_netdev);
+
 static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct ieee80211_link_sta *link_pubsta,
 				       struct sk_buff *skb,
-- 
2.53.0

