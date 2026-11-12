Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460315;
	b=HuRYXupBlp6NhEoEk1AhBkb6b5bxovd+i0YX6XDhjVxAtYSON6Zj/FhmMpj/sVcc9iN9
	 YtmWw4m4/6MktofuBIlETzF2OtWNeuXkcGNzILV8+WGa5siWMevfLftonW8QVwlLDXiIp
	 EF42mkm177DkTcqxuhtggbdRInddLK2LNHURbth/yy8md4nhQutvM8VZTfcY3rWJKYvEI
	 pQNhWbce30tMLhFK8LOqXc5FFSFB6d4GXHXvukfgjkqjyaI70nm+EABLWXPy2+JJDCEEX
	 rY+PYSXPbtQQ5CLn9SY2ce/HBYJjyWxaM23o3KWtNwcspoCWJ/4ook08RBat/cbXKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kJ9UrG8UIuF6bTYdUX55eBJZXu244w1xD/L0FGgiAmI=;
	b=0RIil6HmSzjNgI6KtWACtVE0XxpXUJi2DZSmjf9ieox8eoRE6J5lfVp14qbrUvFbntsq
	 KSHkpJiYV91/DMNKifw07NMw6YDrVfWr3CMClFtRsn5TO2WU/WxW6n1pbfi9EGIuuVQbH
	 AbyNq8x7b81uiu5K4vVdBVMs2aHbfnDLULYAwFGj4eQf1ReKMEHIWZvy42n3vJVh+szKC
	 YOUTJOaMvlPd+SYIK78g8ss4QnBYceZFFDmnXQgwxKx22yeF2kAkEjrOLlm4WKN152107
	 haw4YHIKkAbRjnTJxAwxUvC6lAZA1ooIkQvEmJtuD3UlRsu3IhHZB2Y6gRrAqxddy1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdSO3qqp;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83D606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A83D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdSO3qqp
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8216857eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460314; x=1795065114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJ9UrG8UIuF6bTYdUX55eBJZXu244w1xD/L0FGgiAmI=;
        b=HdSO3qqpg6J1QAEpd9J3MgjOBw1UoyDWz6Jg8OpMEEiNkNR7kqZw2F8IrApBviFmkb
         BzgQ7imprWuC9Sc2bH7vNTx+/J2CMdEJ6GzyAspC+3fH8EAoqdQaBaBdaTVYJO/jPRym
         NVLfH6ybQmf2DKFy/6fAg+ygGoq7M8SFWWZQdHExbmTDCbJcvX8VLwrg84zyEW8VWf+U
         xv2SMXd1UV1brl3EBMoEiPe2yK0WsM1RLoHZVNRVFZSEjfZ9yww0dAySD7pCRs0kcntr
         v0CGdQWdH8Yzl/EQFJRdRL3IL1T6dPZYYjmyhBiaoPZIpl94WeWykhSoZ2tDgpuv8ml4
         N9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460314; x=1795065114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJ9UrG8UIuF6bTYdUX55eBJZXu244w1xD/L0FGgiAmI=;
        b=EJBsIFP2jfpuZ4CL7FqaOWwwJ3b9+5CYdTKMbsW2Krcc7ribUYuGDad2muCcCXfwL4
         tykOzwxnsrlBsJ/dck78ICPBMA7GIcIDGu/Mo7DXx6MlIN6m0b3pU6EsGnd2LA/S6VVk
         d4woF4DN59GPps0qZ6j+ZIXNBPvFKk8234mS0MDO/fpHIvKpEY1l3aROxnCoH+Q9MxBj
         F0T68TXMY1ZEplMkVrVfLVppiQMn4da8TLreBvLfA3XxxdpgOdCCXzkSrVVG7fc8acXC
         59uFj5e9VSRdX4lwrq3AwVi/VSH9jlnQjcHbF6t7jSzHtvcEUDq80YyY+WKrwsCVoUqJ
         dZRg==
X-Gm-Message-State: APuU4Z+x3PodkF/hCNF2PZARExnbbqXKs8ZlH/nh1bsQXT5TKkvuzlx6
	b1qxYIB5Qo3q3Jmutjf7dMFYrx5gK8ieB/nLBFc8XR7yRZXqUxkgipzwcggkG4LLgw0=
X-Gm-Gg: AYBFou1yvW83/r6SWwEJZFjSwu9HdS25fk173YZV+pu/O7eoDvXWIgj/3pbYzuHA1CT
	nferYFIHr8+A1ihtEjNpJihkEzseDnBHsEZ9NBWGC1/inVk1RBmjZnJRQnf2fiEhXbnSxOz3Ryz
	Xdyt8UmJDIXovIMnmLnZG9Yl16Rza82RaR4nEDYEe6G02zM6YfdbMfpPnX6/MtmNugBPoGf6oPW
	6eeWCw6/OPYRjtHed0NenSv/RFgmqKiEJneE+BQKf2/Bi9IGKbBSpliVnOqou3UUmsfuZYY5vaM
	3guPaTZcV91i1T5pS41/Xa064WQJsJyGwJFw6gMTdzRC3jHxKsYhB2UzE2pqE4TtGW9VF8i8koL
	hWJdlVOdzEG/2sjTfj+ssJ6sz5QTRPo1AgeGC2W5fmRRUrJQFEETHayegFSuTVyTEsj5TL/9RfY
	4K2ymIobk8aL5QYT5yjMQvTYsE/qoJwbJq1IXIR/FOUtQTIsaInKHMoUAfS03qM5NpFPl+rsp3Z
	OL1Q/Q6qy3+oxj2VMurKWzAPhtGPzxpBEvATFEkCEAxh9bBZuWmrI44aCHiN8b/kotU9GuauoHo
	NZ6Zq2drEN7BIQU5gfM4Tq+oIPSzlOiuA/mbivq96yYM4wqdYQWv3CA=
X-Received: by 2002:a05:693c:41da:10b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37685d700d2mr4871369eec.22.1794460314140;
        Wed, 11 Nov 2026 21:11:54 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:11:53 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>
Subject: [PATCH 00/10] Move brcmsmac code into brcmutil in preparation for brcmbmac driver
Date: Thu, 12 Nov 2026 13:11:27 +0800
Message-ID: <20261112051142.2797529-1-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
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

These patches move brcmsmac's d11 core definitions, its rate, PLCP,
frame timing and RTS rate helpers, and its channel and rate tables to
the shared brcm80211 directories, so that the brcmbmac driver for the
BCM4323x USB adapters, sent separately, can share them instead of
copying them:

Apart from patch 5, these patches change no behaviour.
Compile-tested only for brcmsmac.

Ragul Balaji (10):
  wifi: brcmsmac: make d11.h self-contained
  wifi: brcm80211: move d11.h to the shared include directory
  wifi: brcmsmac: look up OFDM rates in rate.c
  wifi: brcmsmac: give the rate tables and helpers a brcmu_ prefix
  wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
  wifi: brcmsmac: pass the band to the PLCP and frame timing helpers
  wifi: brcmsmac: move the PLCP and frame timing helpers to rate.c
  wifi: brcmsmac: move the RTS rate selection to rate.c
  wifi: brcm80211: move the rate helpers of brcmsmac to brcmutil
  wifi: brcm80211: move the channel and rate tables of brcmsmac to
    brcmutil

 .../broadcom/brcm80211/brcmsmac/Makefile      |    1 -
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   34 +-
 .../broadcom/brcm80211/brcmsmac/dma.h         |   27 -
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  153 +--
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |    9 +-
 .../broadcom/brcm80211/brcmsmac/main.c        |  741 ++----------
 .../broadcom/brcm80211/brcmsmac/main.h        |   26 +-
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c |   17 -
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |    3 +-
 .../broadcom/brcm80211/brcmsmac/pub.h         |   35 +-
 .../broadcom/brcm80211/brcmsmac/rate.c        |  514 --------
 .../broadcom/brcm80211/brcmsmac/stf.c         |    4 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |    2 +-
 .../broadcom/brcm80211/brcmutil/band.c        |  140 +++
 .../broadcom/brcm80211/brcmutil/rate.c        | 1077 +++++++++++++++++
 .../broadcom/brcm80211/include/brcmu_band.h   |   26 +
 .../{brcmsmac/rate.h => include/brcmu_rate.h} |  170 ++-
 .../brcm80211/{brcmsmac => include}/d11.h     |   43 +-
 18 files changed, 1558 insertions(+), 1464 deletions(-)
 delete mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac/rate.h => include/brcmu_rate.h} (51%)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (97%)

-- 
2.53.0

