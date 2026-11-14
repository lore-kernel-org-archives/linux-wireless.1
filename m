Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697007;
	b=X91PLQJn91SGFjHuUI34WNZi/fZJE8sV1dkWkUsp4gFKTfNB9ijyoAmdxKgKI2t+LKZn
	 0CULS1pix0qL/0HQSZG1OTGncYzp3cBGcsWkl/XWb+b+RaSQCOComptNnQ3k4tAyBxM1/
	 TypDCmgzZkKczWbG6mr/O4TQEwIsXeOw4GxRUxZpSUcWQg1lzk9g5arMz0FwPDo3I/DFJ
	 dqhlOLCUkWTGjTXEVH18yDSGEzFHcRwVPdope475D42aTq9QGsrfz2Gw36un26DUHXmY6
	 7KXaGLUSEKLdLKWEa0mi/2aCXYfRPEszFxfcyvXkwhGiz6m5ommP37/AIGaYJZuW60w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
	b=QZ0L7klpz1h6yP4RBvNh+D0auJieWLjjXaUB66asCoR3V8CwXW1Xom8DRADmNxIqGMTt
	 21l+VRuSVGczlzXaSEH0z6vUUNoyHIbriSLBYT5EjNU23JOjneXQu85ctEgkgHpcRz3Pb
	 C2zHNB9NCjg65rGoGgLjT7pbeaLJYBBYw/6JSG3InYu/KdLgCwWq7xTouwmq12iPn2j3U
	 2h3XuKRvTvC1LODADpaUaodyZ2u6MdlLAJmgG4DIvqhsc0e6nLjHBG/ApaeY9LMvh95Es
	 QtYD5shmasivoStOx8spphIvj6Co/FDQy8AiZrjh39vx/g9dWjA68+8MCIajlfSOn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dxsXFo9v;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD7606A32D
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DD7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dxsXFo9v
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3311790a12.2
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697006; x=1795301806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=dxsXFo9v8Cceh8DUkimonj6sh6I9ELXwgJRVQvLl89FVICkNoNCOUhu+75CYtjjgsw
         B6AkJFVAhuFj5d5+UTrbCdYiA1jdTQJ4Bd3KmmGeXOsk0D3ZBlAS6807VghOboKA9oiY
         RK26PO39NA+NuzRtVrUVmjH8H2gTOr5JnU7zIziIvxqpzduKAafSUel6lVctM2jGEcPH
         QWkU2icUjyKRJVYScMgLZW+FKYb/ciH6V9DDp/SqThkczXdp34/J9ddbcHrnPKVTmn5M
         y52jb6nLBT01EljK7HVaMqPfHbWZURKKmMgv1SUgZ+d/YCAGH9XNamhxjuJ6FZwZrafD
         aVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697006; x=1795301806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=rAuxbexzBFkh7MmUWBYnOHq6sjUfzCH1rd/o1uilSKYTE+FdZ9aSrNZjyL0gA4WCUl
         BVfIjZaqCVgBwYSUpsb0B99OUq8VJHzhX/owcPOc+lV/06fuI5kac/y3fJ7oJ7wk/8RO
         CSCkO3ZIlh7h06ev+fGtdu4AaWw5Upnq9rjLaLVH09Ou5MjdCpNHfyxAAJCVGbA+ACEM
         DqEj1L5+uqV8U8zXz+NLNB/KommdBraXj8ZlmYsA7w2jKCkwmauZoa8PXpIvFz7lO0OE
         HrBu8NcnBd1BRCpPyfP8iuWDjnMGomqMst055/IoyUT+ymhy9KVRKdWy9KeyjQkluXq5
         IOYA==
X-Forwarded-Encrypted: i=1; AL+hErE8OgCpFYZH5mFUreUzzj1fIqQsXWqlJGBU4r25RF/M5wOQDVRP00E6XjZhnV3MGRiXYudPfDDmQY7hcFDeag==@vger.kernel.org
X-Gm-Message-State: APuU4Z8j6wHUL8wWVPiXXvaRfcXf/uS9tXqaUff7gZXVEYIEI0iv2Ow0
	igWeYpOHeY2HvwT2th8/Vu4q5yNxlNarMmRDtej7o6UfiBEOK9xXs/RIkABNyxW0bwFu2liQGyp
	Q5zykmiVz
X-Gm-Gg: AYBFou2pTYLuFUpuxwUruCsMpUbtUf0GhwMAMy47oGZqGm9sePazNV6Rb+OrDtGxnyg
	y9H//szWB+D1vj0E4Ql2l3y4+MG4hDSeNcL9xyr1UBOASCrOmWtssps43IN84+Rgn+HEZS4GPz+
	dwNPomRTip06ufFFQm4N64APGpzSa3Yl/NPtoFbDRbwFN8q6v/dAATT9mFWhK80Ax5Ufeyz/eIc
	l/JGp8+bXzt4s5OYaiJ5iAEvj/MGouGwuItl2kCd9OgiFlHI8VL1moOee0LS6+jxNwDkb4POQVZ
	RN35t9eGZD92fCgBnbgsYjpwNWgCPeXJT0FUH8KIObBJKNS3/zYmWyoDEdLvsAplw/+3BSTJEFt
	rvSUlDVMiLVeJ//OoRWbHjWsh3Pe3AOBl3eX2VkSXT3t7CRr4FE7n0yb8sugnXyhEjzMoIBpf2a
	oN3rWQDN9rNXIc2kNidWYh00zDYga6OEy35ZsrmGEHs144omyD/BF2GSL1wcbofEPOL+5sPU8AQ
	Qo6+7i+9ZGrtGLe5we3Po6bmpP2D5H9/rpEbAx5gPCfBAoUPIjBrOTSNIBSJz5Y9HIRIKvOrnpN
	LxbkoHeBr8lpKkqvvRpJSQarb84MntwGHDeIXKolLgggYiqyVw0S6EomKEXG7X0iHPWv5aXZqIc
	Kg9cH/rZOvZToRGZQTT9qqcAMgseW9/ckzWJHuW+tf0zYsyh5+umq7HxWGhvSfoT2nuRyChp5V7
	Qh6ohq/DEkvG9ybyERwX9c/PTRWdZhBwCJq+kBE/p6ke1CEmmVeS/LW7hMplYow7jVML0vIFVi3
	2bRfZR3PxqFTdcb61cz+7k2Pe5ewUXMBhdJQkdIH7BS3aK+0ILsk1TMXRiLLO1l4tYV9qZbr7Xe
	CV7mABtpJbMmc2lX10uh/lFmvh4Zjz8Ew9flSGSVbTDbY3P1qtkwaZZpS9SKfFLW
X-Received: by 2002:a05:6402:14d0:b0:6b6:e857:19d4 with SMTP id 4fb4d7f45d1cf-6b7c0bbc8ffmr4343531a12.11.1794697005786;
        Sat, 14 Nov 2026 14:56:45 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:41 +0100
Message-ID: <20261114225643.962015-1-julius@bairaktaris.de>
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

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1 is new: with the firmware down, a key whose removal failed stayed
in peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 3 of 3 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

