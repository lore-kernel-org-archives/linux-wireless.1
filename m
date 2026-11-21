Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288533;
	b=uvP4dRc3Jq4oVTgQL50wdezC5PA2Z37LJ5DJpom0FZQnVMZppzUJiX4GOPXxow1mk8RA
	 70MCz5wipvufEhStFEHxto24ZYFB0Gy5DWUMP5SSDvtdeC2yI5cHUTml/CkVNvhnbsSg2
	 N13roPb3UF3k0PcyCZwwxHAY2sZVhCmnTXon0MscDublOyfKf47uwpnInZ7iK1W2zRPJd
	 DgApsXxVTmN0+RYqF2SS2ywj2sKu/IU0+570b4kj05J3wRvKByEeau/7jkYXYJKuw8M7J
	 mMxNLtftETYOe/oejp5qs3vMOAJ+TK659QPmhP0C7MVZ/vj84wpwvZAUbUtuJ6tV2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
	b=vs/p7DDlRIqvoilFN1+aEVa52F0BBX9EqwNLZ+tt9SypKNKWqCEBdA4JHmCCoZfY/SPY
	 LZRpEKbrC7DjQP4Q6Q1gEHNdOr9s1WnaHx3gjxAaV5yC1vWC9ws5nrqm7VKRB7QQgW7vf
	 OKVIf4Yi4GNsJAfAlXLqhVJanZIzpWna5z0jYVj/1PWPuk3hUSDRMjrlrzKyzxWjzTOdt
	 fc+6VzCsW5hHz/ytkeXSvn199k0rFC7nOVA4aBteJzWSJ0OZYKa3gAZrVQbZ3ZKdaPgdI
	 jLF2ENLiirB7HLR87s3B/131cVByCO2TAV8oiQActSkC2Vn7zlHanw5s/h3H1OWo54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrW9pljv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977E3606A330
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977E3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrW9pljv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10808785e9.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288531; x=1795893331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
        b=lrW9pljvogIQJMAPD1HjzkVAE72U83bgVdExyRBkuoylxhafUbM1yINJrxAup0qRl0
         ISO2qlGwdzhO+JyXBwK2SZAr+L2vsxM7SGuHHdukzchRoteUovPxgge73Ynp7wA4k7Bc
         OlVdO3TdmQzRWoRRFaa4Snuj1ieoGCm5oCGpGC4/GeQrN8uHFP0PCzdT/pkDRqNQL6EP
         RiaKkG51p0YgoSYwA3WA1A6fb98MtZY+NHOfZaGGddfJ/HBLTaBW5jcKKPqOfX0ztwR2
         B8tgEGuEqoBq9ai1ELNiJHIXZ3oMH2LT/qzZHCgSzczI8WyaAZ5jDN3CTd5a4AHT9l9J
         3Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288531; x=1795893331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
        b=ZWP5G1NgxFrQQYEPGEoGFCpq6XpbTJ5HHKPH1GgU2J2VurnOlQ2dh7x2bCXhNa1j3Q
         7mvJUEQz4HM0A5oCJ+A0Gl5I+LV9G63pDuDaJIE52Y1ouSHV2M54+lR64iBzvBr09Nlp
         9ejko83vS9oEZSDdMoVNNb9VD+rDc9FCNONUBy4fzI9Y3JB4TaYWRfBWbmYW3gJP2wR4
         RXzseYI6FySddWTKPwjIhdytjF7UZREI2I8URT2WflHHGEx/AVIKyqyGv7FUB9A6yj3J
         mYtRWETZjeNhsFNdsKme3mL7ZTKDR6etG7IMxm0jv2noTUJj+Q6wBGUOFBS1ftmYauhV
         w4kQ==
X-Forwarded-Encrypted: i=1; AL+hErEUMbgSxAKYvVPFGH8zvtz3ViJSHYDqDDICJ7WHFYBlNF3/TzXrfJYSR0FuGckzRgshTSTuIRFkv7iUV2vbHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pOin4ZyeBiXKmAOyGhi9lpVDT3eWy3vscTdk2gFJlPXBlELiR
	NMEKAmugH2jaQmJRcEq4jkCBtiCWW1p5c79MYJk1F+Q9OzACOh3Qi/O8
X-Gm-Gg: AZFdTZdM2nPpj1ZpFCulZeLBebp1UZM4QU/m74VGeXDfIKd+EAV2WeErQgjeDgWAf+S
	UUPivS0F6+KJBPk8SXpHLwMw968PBqrmo/aVmJMNfhTtMcAl0clttOxi3S+cGzp4Bykp3ROc5TO
	J9VVqsxqA4GIZCKxaK/NhMlOWrjhjGt+cDi3PzYpCT3MU102s62pDvMg7iu4Hwf1fQ6GffyfWgN
	+W/xaDMFtHeKpGgHj9aoYkAvL5/pCGfdYFyRlUXqqsYQjk+DnLD0CRXu8TOfz+IxHTofIykxi3H
	wwxWLAHBk8Dgt5gDfZ8L8ECSU2kS6GPlQ6Z7Qp7Y7isvHW/+y0DohEf6QqgO9MXhAmRIdxlrKgn
	P+twttv+liOmjR8msDXyVQrZRGNxH5jeHUNTOcoJ1ctnaCdKsmOhEEsghI1F3FEkJSjCdhxYrVe
	/nPcsyzsB5eBu4TOT7me3/ZJLf6j8RTPWGG25563MVFBqywN32w6GjCM7NLG9IYXKc4sa0tsmi0
	oiq4TyEgk/o7EannQ/rprky1pAzC+vLQxLpTyCkXfI9KreSpQLuOmpl6sWuGuCLSFGixEzOaqla
	4G+skxNrae8ciUrf/r8Ejw0SNdCChjM9iHLK
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr147640705e9.5.1795288530817;
        Sat, 21 Nov 2026 11:15:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 0/4] wifi: rtw88: fixes around the firmware recovery
Date: Sat, 21 Nov 2026 20:15:24 +0100
Message-ID: <20261121191528.591334-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Fixes for what a firmware crash test showed on an RTL8822CE, and for
what Luka found in v2 and v3. Patch 5 of v3 is dropped, commit
3f2238709f5d ("wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start
failure") does the same.

Tested on rtw-next 0bdc579dbfc2 on an i.MX8MP board with lockdep and
kmemleak, with firmware crashes triggered from debugfs on the RTL8822CE:

- patch 1: no reserved page leaked after crashes with an AP or a
  station interface, where rtw-next leaked pages on each crash. The
  beacon update work and a WoWLAN suspend between the crash and the
  reconfiguration found the pages
- patch 2: with the firmware TX reports dropped in a test build, hostapd
  got a purged client probe as not acknowledged, with no ACK signal or
  link ID
- patch 3: with the collection held back in a test build, a client
  moved back to AUTH and deleted in that window was skipped
- patch 4: no "sleeping function called from invalid context" on a
  crash with an associated station interface

The regression tests on an RTL8822CE, an RTL8822BU, an RTL8822CU and
two RTL8821CU on both bands passed, except the 2.4 GHz beacon test of
the RTL8822CE. A neighbour AP's beacons pass our TBTT on that channel
every 157 s, and the beacon loss over 330 to 400 s is in the same
range with and without the series.

v4:
- patch 1: the pages are kept through the recovery and freed when the
  interface is added again; no port checks (Zong-Zhe Yang, Luka Gejak)
- patch 2: the TX status is cleared when a frame is queued (Luka Gejak);
  Reviewed-by dropped
- patch 3: stations without si->vif are skipped (Luka Gejak)
- patch 4: no change
- patch 5 of v3 dropped for commit 3f2238709f5d

v3:
- patch 1: no RTW_FLAG_RESTARTING test in the beacon update work; the
  page download and the page location H2C do nothing while no port is
  in use (Luka Gejak)
- patch 3: new, rtw_iterate_stas() cannot skip a station (Luka Gejak)
- patch 5: new, RTW_FLAG_RESTARTING is cleared when the device stops
  (Luka Gejak)
- patches 2 and 4: no change
- rebased on rtw-next

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v3: https://lore.kernel.org/linux-wireless/20261117171003.1840491-1-mehmet.fide@gmail.com/
v2: https://lore.kernel.org/linux-wireless/20261116072014.1142494-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (4):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: do not drop stations when collecting them for an
    iteration
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/mac80211.c |  8 +++++-
 drivers/net/wireless/realtek/rtw88/main.c     |  7 ++----
 drivers/net/wireless/realtek/rtw88/main.h     |  2 ++
 drivers/net/wireless/realtek/rtw88/tx.c       | 25 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h       |  1 +
 drivers/net/wireless/realtek/rtw88/util.c     | 23 ++++++-----------
 6 files changed, 39 insertions(+), 27 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0

