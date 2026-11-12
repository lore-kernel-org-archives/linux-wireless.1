Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506189;
	b=aWuWtHGf+OOW4OegRZCLgNnoJ8OEhDLu8AG2viV2P1SRKyGQcv0jbOP4MfHVzpfWHMrS
	 edaldCqHHx1QCTYG2IClFt9M0iltDNCPCznyw9YD1CicBPVj1nr1rbZqqJ2H3GM7Wh7Rx
	 XphnKSRtJ/0NV7dN2VOUafT2N73uhcPL8IM940pwjJ1ZyaanJ6a63kSEZDqRYxAnWrslB
	 TKfXlfxuKewfvcSNjjZP2otoz+tE5z5pEjzCNpt0wXNHVdL1vA6SMyrvb/tn0WIaliWLQ
	 NZv3tJzhZk+ahoz2sTOFygZo/wkQvxL6EkOVYpAig6V64V1+Fti9biGjyE75yCgMBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
	b=jkl31b7P/DBLI9QYK6b7gCAGvO+m/bcW7cPYRQjKlQJsgX2FDzKi8alu/wdNeKONLrBU
	 FGlWa+OTHBYjA4ub93QZnV0Shdn9nGBx6zcvOybci5V8eoKaC6g/uUSyI0S/djnviNX3E
	 oNgwBqejcul0okNahx5e6NgE/eV8Ws8D8ymszI3hYh0rrYdSnf2e+Yq+xgJIjUc+ouSyV
	 mUF56LRIqm58MhGxWnWB2xIlm7TQM9RRas4XArp5eqcKKs1tU4Kd+e/oW8GVMMh1OY5cv
	 Az+5XFRuBoiaKuu4bvTvy0yvA/7rrE8c2DrHHsMDdardTgL7qnKMq/5hi62QUypHJsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HC/WBXuF";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA29606A337
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA29606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC/WBXuF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so24114f8f.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506187; x=1795110987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
        b=HC/WBXuFGpWtE6AfYCAizOd65Jyt52yYL0N36JVe4HG+aAMg5yOybFVJncravhLoqf
         bl1yylnzEasU2K+Lsq6Xun1KawWylds8oqcPJ+YszYnsCvKdy+R/nVuyk3moPqpzJbjD
         OK+4A8cTDDHdKSeVzmvM3yuRGxFo3nY55tTV8/duFYzHXs5NvXIIqRU3yxOH1kPbdLsT
         LWfRbMyc+214jCRR+4b24WKUMRVpOCndpBd8QVLEKUgMwZaarXg1eBnRRpwqlU89Kdnq
         y+B9BGy9FAoFkLCc306emUzz0I+6OSWun15+FFiRLYQ/W6o+UnjhV5BF9wGHZ9/OSDo8
         Jixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506187; x=1795110987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
        b=vDt2IR1ZagEtjCRo4632TWPkWIa6BPko1anYIzpqtmK0pT7/MPlt0Wyk8xJzYcgcVW
         vov3ulNkuUSko6en7XC6quSA7B9klTRu3NjdM3ZCN1ytnzczpcFCopym3RQks2lMy7ug
         sdob0hkFCukVbpF7wHg732howKsUKJbc7zmfkFtLP/AkktQUODwjE+CNdMj/HHjEMxUU
         VUORrusI9iF7CYV+SadHUnrtysGvzanbwlwaT9RKzYBceI+S6JWsyUKRQmFRUpd0OB5q
         Lq5g4uO+HU+h4u/14r1LA6J194Zi87DjE1klPON7DcpPSHT6Myk1fcHvciAddiLFHSDa
         BJHg==
X-Gm-Message-State: APuU4Z8wvNhKLV444rFpF8793oG/NOi/zx3lVESScOwWHy2TO7gQlpDK
	gF0ajT6XE8gR/sg77NJ8sHbSqJr/PuD2TFoCpH3OHGI92EGTnF2GHpoRtU+iZP1ZXlw=
X-Gm-Gg: AYBFou0BJrTU+RFFqKXGJ2HUN9ZJlkldvQAXteiL9lIJxjzfJK10hd8EcNmLqN0ZY80
	q2BlcieHDsxQoZ8A30XInJ1hZrcXF8CfLtiua8VRlaw7ignUT7eF/b/TMxGpYQ9yD9pqqb/ogo1
	YTjyZ/meFcl8LYZzUp9bsvMJl5IQG5w97cuZc0GBNGqSoLkzz9F8fxv+yq4vXmqGivxlmHv8u1/
	ATowiFwSt7Fr6UdIulg8fVvECzxyXGEUXjUTEetl3EBeE/Ut63qLf1CUA5gbRPqjdbwcFfytdgj
	k9Hl5lk44SOtA8t9EljyUHFcXeeErqOClRnmg1N41pcTJfs9NETr1Hi9cqYNWF3jWW621KVfjJ8
	zYLQFk3vN2Y9+U4gwZlC3sZW8A5Otn8Gb28dwpIM394XPZPDLhLYP3SaqutB5EyEkCjoereqSPg
	TOpNJT4e/MISlwrRDdJck2dDQA0UDh9ZbtlKs+2qe5S9ZzTv+QF9FlCVEjoyzBMB/Vxa9XvAzRZ
	k/p0a+QfnntFfiTliVXpcS7gASTgHB13DHb3Du6hje+EyYQyci6MDPAB8tyIRuJ7gA3PltX4oq1
	4lURPcpXt+ebTGu0qBZaXMgyPXuBA4RGyHb880xjGEKy4apBzu1XfA9lolQ5E1IH99GlPAgnrr2
	bi9ULOvs10PxMPQvePFLL1+05unn2Lbz7e3j2G5Zac3pv6mLUVb5j0LVQ01LTW7ZzToiESEGIti
	5Cuo3zhhILJBlT743L8XxOp5fX8PrQ5Sy0s2DjrWDfbw==
X-Received: by 2002:adf:e00e:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-49c710c24f8mr229471f8f.36.1794506186972;
        Thu, 12 Nov 2026 09:56:26 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:26 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 0/3] wifi: b43: core revision 40 and 42 MAC setup (series 2/4)
Date: Thu, 12 Nov 2026 18:56:21 +0100
Message-ID: <20261112175624.40547-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
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

MAC core support for the BCM4352/BCM4360 core revisions 40 and 42. Things
that depend on the core revision are gated on it (b43_is_ac_core()),
things that depend on the microcode layout are gated on the microcode
revision (b43_ucode_is_ac(), revision 784 and above, set once the
microcode is loaded). The TX and RX formats and the PHY are not in this
series. Based on series 1/4.

This is posted as RFC so that people with these chips can use and test
it now; b43 is orphaned and nobody is set to take these patches at the
moment. Series 1/4 is on the list:
https://lore.kernel.org/linux-wireless/20261014143225.82149-1-gonsolo@gmail.com/

Where the values come from: the register sequences and table contents were
taken from Broadcom's wl driver running on this MacBook, by tracing its
register accesses (bpftrace on wl's MMIO accessors), and reduced to what
the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
Farrow resampler formula, the VHT fields of the TX descriptor, register
and table names), and some formats follow brcmsmac.
The result was tested on the hardware as described below.

Each patch compiles on its own (kernel 7.2.10 headers). The four series
together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 42,
microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC PHY
only comes with series 4, so the earlier series cannot be exercised on this
hardware alone.

Andreas Wendleder (3):
  wifi: b43: set the DMA burst and prefetch bits of core revisions 40
    and 42
  wifi: b43: MAC core setup for core revisions 40 and 42
  wifi: b43: address match table, templates and beacons for the AC
    microcode

 drivers/net/wireless/broadcom/b43/b43.h  |  14 ++
 drivers/net/wireless/broadcom/b43/dma.c  |   4 +
 drivers/net/wireless/broadcom/b43/dma.h  |   2 +
 drivers/net/wireless/broadcom/b43/main.c | 242 +++++++++++++++++++++--
 4 files changed, 246 insertions(+), 16 deletions(-)

