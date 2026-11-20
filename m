Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215584;
	b=LkShpIEjQWMYDZ14uIxnLr37+XnZFW2tcBKPreZg1jPfmw6iT7pwbfy3uTx3xCOZgyIT
	 IQM4Erqy77/TQginrTNKkMlWHKPJIsdK0/XdS+Z8pX6Enpz+sxeyAVgfbthhjf7kMwGFH
	 2IWFpyU4JkBCUcy918tRRBlQ61HdazGanP+jfPHGojEn03GjIgyCNZ2Z6mAbrkLcBqYL+
	 /Ipk5AhMX2f7AFQy9H8oHMKecA8ghho7sz+/SFmSwvXdS9wFu8w/qXSRle0zT4I075oM/
	 nc/lkU/v0sgc0S4571UfYZxivTwkJng4CmaXnb4yR+i98xiamVGiAn9ZAG64gpV6UKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
	b=mV2e/X44HmhRRuAlX3G4O7yRnYYnFwwTI5BDblXn9Ckt7zoYZsCtnD2m3AXW86U2rxx+
	 3Cvfbu/79VZkPAodbfM16leKVAsT2O2Lj/Jeuz755H54SFMubxgIUWLpPijEx798HdEFQ
	 Lblhso45Gmqy7waSQgIS32l3Gu1L+Pa5G+TghhozD98k8ec+Atx+Z2nDcdZ2NHASn8sjy
	 KZYAfCcgFJUUaeq9EEg9bANWCJFKIcs4aT23YmrItZ0KKAKPOttLqOrSqcSbl40WZok3K
	 cWtksU7t45oUjk45PKwaZxBU0759IF0RS1SB1BqZMY3RQ3/xqXnTAl2A39t8usa2OiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgyag7Vl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A9606A6A5
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211A9606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgyag7Vl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14372495e9.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215582; x=1795820382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
        b=Wgyag7VlNwEQyOFpTOPV7cGFr5SQm+kr70UOqJjN5aYRoX6r/PCzOFGv5cESe327gK
         +W6dZgscQvFe9M3WhckhMG6WZNEU4iza1FaocSIOe33JTTw67qAnnOOnJF/oZLKKoDdo
         M2awmXP+e8XVDStJ1XV8RP0onDcqmMRhoF51e05MXzRjIBVd/IVWXMoH54GHzfnE0L+i
         ofbLJBQoTbyiZsnPscN2u/TjIFpYLnublajx8wekYTyFe3YDQHWcRIlZp4pcKLq/ELbi
         fQ/6t9cikUnBTVBqEZSleZQFKop1/niMwHYpOzM7Ixg407hdQy6bfsLkFNX8nW3paP3J
         e+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215582; x=1795820382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
        b=HADUgACsZ1gxmU6tOdo068wNNP1S+6tf/S9R2y3KzWXDHn9VGHwJlGuhQDnKbksqEB
         tMW9leZNvTwDJ1Hk37DHcs1HCmbB+Vj/D/OWQR8GeWAV2bbcvRJaBsp2JnnNlHmBahDt
         J+QDo+ozwxoo6fQNjPDYrvv2GOqP/uPK4uGD1LCUb+1uLxyFPcRqA0oDCakM1watsByg
         eoa8OJLqgTEWo1ZSL7aw4Y8kACEMPXatXfyGIHYAosnGszDYmOeS4bZKYlWTi/3G4JyY
         6aX9zvUAJW4pdhDFnV3i3tHfNJ2rFhS74b3bbRY5G+CN+I9NeDQwwIRzmveZX81H70gd
         JpPA==
X-Forwarded-Encrypted: i=1; AL+hErHTz+oPzHLPAlekNELJuvhRyKSKxqLgsAax84xn4eu5zx9uThB21Xu4/Tnxcxk2mLQJ24vk8yh4JWtXOWikRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/06JoZqN6JD0jFoFCaqPNAuJUAdCzAE3oBYozkFc0karlDTHEH
	eFyXMGfecuY3BP6bhhNSq1IKJx2UhcJVfSEihj9XvOtGqFZg4Ao++ro=
X-Gm-Gg: AYBFou2Ly3/IrxZlwLtURO+QbvoK7gSnfyC3fDavPECz/92Xwx7I2im6pOswji4fF3n
	tzgRnHYhScRtFBej0OwstoFbRu3BFA1t4qhB73dXWdL6ae2KV9sOpzEbJOLeYWuez1zeS/z6oAJ
	Ilqcv+UdZo2R7sK5ihkQfmR31CbfTpRFQp1eHMhNTvI6xKLQqw95nms3fatvtEfh1H9anBf8bOV
	dN24xkgpEojJk0Nt+6zrj341A1zbT7SDvR2dlHoaEDYEAUaj6bbziqJK1LHRHNQiP2tD7mfF9pA
	x2icgH2bQUITPmGICONKmjY4WsKZXYEaH7p4Q7yclbrY+OETNYaRYG91yRHYfq25WiMQafjX/um
	6SpLz31BLBbqpwGo+qQ5Oct+BnjeX7//LCwITn5i9EUWZPlb8NxV2mmfvBVvARkDYp0EuUQWUX/
	y/augPxcj+OtE0klLf/YFvh7XaZHXIA51uBozZQ4auFgI2NDYHi21w3tlWZ4LuiYmxIKptMx616
	UUprGYqCWY1wxabKlAK7HaTg0+AHq8+W9ZTF1p9hm4XeXBY+iNuQikLXIi8XUMOakcnBtYJbl+o
	F1ZFsxnZKDk/iMt4psF0avM/LaSF
X-Received: by 2002:a05:600c:a08b:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb88922c52mr96824465e9.13.1795215582473;
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 0/2] wifi: nxpwifi: firmware response validation fixes
Date: Fri, 20 Nov 2026 22:59:31 +0000
Message-ID: <20261120225933.1148680-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

The nxpwifi driver trusts several size fields from firmware responses
without validating them against actual buffer lengths. This series
adds bounds checks to prevent reads past the buffer when firmware
provides inflated sizes.

Changes in v2:
- Dropped the HE capability TLV length patch (was 1/3), superseded by
  commit f17e2eda1630a ("wifi: nxpwifi: bound the TLV lengths in the
  11AX_CFG response")
- Patch 2/2: moved the response size check after timer_delete_sync()
  so the command timer is properly cancelled before the early return,
  as pointed out by Jeff Chen

Tristan Madani (2):
  wifi: nxpwifi: validate ext_scan buf_size against event buffer length
  wifi: nxpwifi: validate command response size against buffer length

 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 drivers/net/wireless/nxp/nxpwifi/scan.c   |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.47.3
