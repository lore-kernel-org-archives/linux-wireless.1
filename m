Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597585;
	b=Ws67s8HlMoSrQLvRXJJnnMuAoCHhOhfIDXDqmMQ6GVIrw34nM3uvVcI7QQCXC5ttqLFD
	 f8k4rJQ5/bWRscYa7qgXfJpGUAXkwm69uDTix7ukg5W1jo8ci/6gGTopNhT9k1oJuKvpe
	 2iW/JZ1HenY9MvMxmMmRudKIT3SBm2WaTNgO/4lEtNMST4CC0YGmRroW7T35INdfT+55l
	 uPQHO68FRsWILJjhb+p1R4B6U2Bgh/5sZ830QckC7Iv9LrvhI6NM7HeNnnY2lIT8zavJK
	 pKbiqifN51g7QhPZQaWgbvZXTMNuMrCn+UXI5Ob0ABnYATklL9AxqxBs8O+PBAD7Kuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
	b=uWHFKAHKetxI4Pa2mF/1TO7o75sckZU7aNfilE1MPNz/pH2bnZv203cc2PSfIYS8mMab
	 qkn8xCq3lz58DHU7Qe6MuxM4nzvfP5OP0Kh7WSRz0qaXWqVOmWrZ8/M9TOmUzrmOU3C44
	 ZO7+zDqzTqUAHSMP4+dhRT/Zm0qowY6Td54KtrqV82lfwXtSK5AjMrvw88fK3Yd0fSEbP
	 fOFHA1STrt5j93YjNAVd5eE0hbaaDJbM655HqrJOxTvt7TpUMl+0DThgKN/e2Tv2qbXLq
	 KlYWQHryBgXkrTubGO7RLtytIYrAHixwwNOlNsTd0XthckCC6YoiT1CPnz9RfBTyD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6AHOlWg;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D55606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 09:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D55606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6AHOlWg
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so3538841b3a.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597584; x=1796202384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
        b=s6AHOlWg2deWPUzAakdw2WBvpzEOnyC6kV1RVAXCpfRiplizozLW0AemyEbz2q87Px
         K3ZJbR8X+UVugfncmx7+v3bQZb0458Ma0CokgggfClzEQdZ5F36+KZvnv6jO8RtLB79q
         05EI6CvXj/KWNnYm7BbjriU7sbs/ebB9UglBFMBK9YNnjIzNFTsoHWfzDjQhcsEsOmiA
         vZhBijjCrT/dNni8aHWh/9K1iZ2kIspcGPev+0yVLUd47Sw2kbP9ODjzTMvXqs0sMB9t
         BxSsyJ5UHOgSrtcf4TnLbf/WGXOELhN7a42y7fVKfG2rQ2qHY7OfjPkH4E48lpkycLu8
         rKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597584; x=1796202384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
        b=BR0wE0ALfTgFcYgfxPmA5OYO7bveGSBfYB6annI/ASOdbILZ9m7/0g9uEHqp8LltVM
         WhFKPuclumOSw+onrmQQcTMgHtBJNFtOXCpd3dKcUuEhDaVxWJ3i82hgOL4ZWAUqZbrj
         EDB7LUJ9rj6uq3/9hGDq7D9T5CWUq4nwcQusx2qd+9TpLDR5ytyn2fIaFrn2n081FpKf
         PRrmKxSJEkhjUdyo92InadTBqjphXNAHQs2Vyh9McnFxyrFZ7Xfa96B19+WfCd9n09gA
         2fTW846RftCiMb/hbrqOeffY44d/2I9lw0oWmdIkINZUTmVZ23LT6LsOotlMkzdUvQZw
         U01g==
X-Gm-Message-State: APuU4Z9llBJj1wqcCSCXCHt3NugFuWCwbjFV/kns9c9iAClioPPL4Ea6
	aOwqbW3LsUlZJ4QYO4Nn1OFXQOTa+HPCH2b5lyXnsQdSFxvA4SBETRKTxd2ppo0=
X-Gm-Gg: AZFdTZeLu8Oe7v/gcFYOoXYm4I4NfqqXSuMJRbhRQ/vtc8EnOrLsS6K0B5kX1n7S+di
	cZMnbWenwMEdGcZOSX8HNbcNY+Bs3vFllJAg3ee0f14TWCS3yLTqEnuByLGsxtSCNzpDaLTw+wU
	Z4+aWvs1gqyL4x4luMtNnHXE9gunE/KChWZ2wR+LLn6C/HIH5adOskAi7AyBDwgOrkCCDFBIWqG
	Urf2D1B5ZgFNiCWaRFslFcTRJsKowLexD5H8CrECkuyxAXnpaOgW8Ws4uDc8tRVG89lTD6bYik4
	uIBxgZlZvfs9bRGWEW/pQjmi3ZhC9DDPNXgGYVmpGNr2O+Q77B1Okgww2Xr7ABPBZMQrEalo7+N
	lf8gP5RSoZTa1PvC/NjzR9c2rvmPbD/Ub0lkbEvbrxx25eVHA8Gr1s/1FSg28DaLKEGul4ifBEp
	6Rjdf4CGBTljy06nTLaMW76IHfn3cqdv3dczblRuUIHiWdJz2aOy6N79IP1Bz8s5R83pdCFpGOT
	og/KCFJuT8TrdYmmCDinzDoo04N3EWl334C6RBhhxSqs2khDvWlcdP7GHCBOEiv+X5F5lVzDyIH
	SEqxN8fSv+jNg3HflNOfuvFL6ry5KarzG2OHzZt90Yd046NUntTrpuzha76VJZPfhWZp
X-Received: by 2002:a05:6a00:2295:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8c87bfa5502mr14791566b3a.32.1795597584300;
        Wed, 25 Nov 2026 01:06:24 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c228sm8468090b3a.10.2026.11.25.01.06.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:06:23 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: wil6210: fix BSS reference leak on unsupported EDMG config
Date: Wed, 25 Nov 2026 17:06:18 +0800
Message-ID: <rc-b1-20261110-vc-35-5e6ef2ea7917@gmail.com>
X-Mailer: git-send-email 2.50.1
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

wil_cfg80211_connect() takes a reference on the target BSS with
cfg80211_get_bss() and drops it with cfg80211_put_bss() at the out
label. Every error path after the lookup jumps there, except the one
for wil_get_wmi_edmg_channel(): when the requested EDMG bandwidth
configuration or channel bitmap is not supported, the function returns
directly and the BSS reference is never dropped.

Each such connect request leaks one reference, so the BSS entry is
never freed, even after it expires from the scan list.

Jump to the out label instead, like the other error paths.

Fixes: 9abe3e306ecc ("wil6210: Add EDMG channel support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_WIL6210=m, CONFIG_CFG80211=m, CONFIG_COMPILE_TEST=y; baseline and patched cfg80211.o, no new warnings.
No hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

The path needs a connect request (CAP_NET_ADMIN) with an EDMG config the driver rejects, to a BSS already in the scan table.

 drivers/net/wireless/ath/wil6210/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index bf060281c9a2..0d256f313511 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -1356,7 +1356,7 @@ static int wil_cfg80211_connect(struct wiphy *wiphy,
 	rc = wil_get_wmi_edmg_channel(wil, sme->edmg.bw_config,
 				      sme->edmg.channels, &conn.edmg_channel);
 	if (rc < 0)
-		return rc;
+		goto out;
 
 	ether_addr_copy(conn.bssid, bss->bssid);
 	ether_addr_copy(conn.dst_mac, bss->bssid);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)

