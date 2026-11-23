Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.217.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440060;
	b=AXrcxuV1+Kv2GtdSVgATPSeUo8wbDjE2TDbTzE4iBAVK/k/0DhInLb3AAQ04FtIGAbhG
	 teXqkgvhSBO38upYy/hKDLHyjWG4c3cdskENwG68KlkpzUyBUpPNHQldv5tpqBEP4TDaT
	 +wc/knHOBbsxcLbAG5F1iT8EX0m677oWv2+lGVXclWTqMqAxajIY7CvnrFaJXAGh2GICb
	 UAotLIY3Nkps+XH6pA2kHiKcFG3ZGBm1Z5gC41SKTrE5v1BZvVrgsRhhsfR2booQglr9n
	 AJ1z/GAbiBWoaNaCtLl3o5oeHP9loHwJm57mYoQdbi84jEKZyciKkFsyQRvuy4wJpmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440060;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erPBlYocGXgB3A76+ViTjp/+10KAGuFXaW/j0JveEgA=;
	b=Epo4Yjz+w+pCCvz+bhI7TvBKO2jgi7XFZpPGi5qL4tKGT6ZI4E8nBPnTNYHj7J2OCvUJ
	 ZoeEPnxar0HT8lqEayqVA0jMkVYXfcFTWCMuo/0GHl1ggGJ1eG2Awzkwzx3Ze0KEch6kk
	 +fbMaIF7AJSMt+XIWzq7r4MiBtqbNtIY4aZoX86lrcRobt7RG23pPiFRUZFcQQuXanFrK
	 uEWK9YJ8y4vez3hodhYKgM9o16axOHAcm58RH9fCLa50YKvhEcPshiwaoOS8YCD98Y63B
	 xoRT+CPc3qw4q2JsO9wmDRjgENqvcvfjQPR8ewS2cG4PGcyTDLRhpxKd2rkFq7y2kMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tu-dortmund.de;
	spf=pass smtp.mailfrom=tu-dortmund.de;
	dkim=pass header.d=tu-dortmund.de header.i=@tu-dortmund.de header.a=rsa-sha256 header.s=unimail header.b=ecWkpUGh;
	arc=none smtp.remote-ip=129.217.128.51
Received: from unimail.uni-dortmund.de (mx1.hrz.uni-dortmund.de [129.217.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B9606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tu-dortmund.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tu-dortmund.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tu-dortmund.de header.i=@tu-dortmund.de header.a=rsa-sha256 header.s=unimail header.b=ecWkpUGh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tu-dortmund.de;
	s=unimail; t=1795440055;
	bh=erPBlYocGXgB3A76+ViTjp/+10KAGuFXaW/j0JveEgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ecWkpUGhVOOivCqkJrZ31/A6gzqJkjiIsHQH34WZNMjR9j+D7AtoLOFkQVyvM4zca
	 CKLJqSB0Th6sGgP5HBDpq8aroGRYl4yTvY+q/41Gc+l2ECOP/JQzT1lpN8fP6906e+
	 vJKkwJGc+RSh6YGFm8WqZ7wPqXKCYMbHRwrUquzU=
Received: from simon-Latitude-5450.cni.e-technik.tu-dortmund.de ([129.217.186.115])
	(authenticated bits=0)
	by unimail.uni-dortmund.de (8.19.0.2/8.19.0.2) with ESMTPSA id 6ANDKsRO005408
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 14:20:54 +0100 (CET)
From: Simon Schippers <simon.schippers@tu-dortmund.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RESEND wireless-next] wifi: mac80211: mesh: tear down BA sessions when the peer link goes down
Date: Mon, 23 Nov 2026 14:20:53 +0100
Message-ID: <20261123132054.345948-1-simon.schippers@tu-dortmund.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120142515.463101-1-fmaurer@disroot.org>
References: <20261120142515.463101-1-fmaurer@disroot.org>
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

On 11/20/26 15:25, Florian Maurer wrote:
> When a mesh peer link leaves ESTAB, only the plink state changes. The
> station entry and its block ack sessions stay until the station expires
> after mesh_plink_timeout (default 30 minutes). If the peer sets up the
> link again from scratch in the meantime, e.g. because it rejoined the
> mesh or restarted, its sequence numbers start from 0 again, but the old
> RX reorder session is still there, with its window head ahead of them.

I had Claude Opus 5.5 set up the tests on my hardware and went through
its setup and results myself. They seem legit to me: the bug reproduces
on ath9k and the patch fixes it there.

Setup: two TP-Link EAP225-Outdoor v3 (QCA9563, ath9k, 2.4 GHz), OpenWrt
25.12.6, kernel 6.12.112 with backports-6.18.55. The patch is backported
there behind a module parameter, so that both cases run on the same
image. The nodes belong to a bench mesh that runs wpa_supplicant; for
the test each of them gets a second mesh interface on the same radio,
with its own mesh ID, open, kernel MPM. The node that keeps the station
pings the other one 10 times per second while the other one leaves and
rejoins without HT.

Without -> with the patch: outages of 94.4, 94.5 and 93.9 s after the
new peering -> 0.6, 0.2 and 0.6 s. The outage matches how far the old
reorder head was ahead: about 900 frames from the peer at 10 frames/s.

Acked-by: Simon Schippers <simon.schippers@tu-dortmund.de>
Tested-by: Simon Schippers <simon.schippers@tu-dortmund.de>

Thanks,
Simon
