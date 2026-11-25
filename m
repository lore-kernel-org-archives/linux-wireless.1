Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640478;
	b=YQTvhJTxnR99VJWHYtymwU7HybGgdJiGSad+bFwrqQyKZ9zjfKbchHTlWnUZVKvh+N8Q
	 lKmOE905D4rHXx814U7dRStEtAFTW2yOxTf3hkNcKfrCpDQddnY2LCPuWGYKrxjA1d422
	 5SnSEznc1w6QE/0bU+g0S8/B2bLc5i69ffgPQhrsYS6ePU2KVMGHDwSXF+iAe58WFJlEB
	 jPDV/MKdNnsxJq338e2WFaW0xmQeA1NC0hn8EOKAqmrVFotU7sGgr6YknYXgTvrICTttU
	 w/m46QhXzm70QKSd8vcxsvxlSeEFvczmpwU1CBbNTPLIixwUMFINedhe7W19p5g541w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
	b=Ka5lXes3JIgKMaWBSLzstPCebawySsPCQ2qoHpPKUoBwAi6nNHnZYNn8tB9/uDQMi93c
	 Gm3EVArA6pMC/hygu7btCYscjjRRLP9NLTn8bTSpi6wD2QXdhzjNY1wdIaCfDUhC0wEA/
	 Y1fyjSBO4CxxNU79ulPC2qH4PSrhJuc4jcCbxlAmWuYl4NgLNsmSRBvKPB6sUxOFZocBg
	 j7spUBzFmLKmvWm++n0dMW7WEH3T6Ij2hWV7ZV19rEnu1CZU1Ydw7F4CWx8vtY6LLEMc+
	 CNLYlNXLXN0JDjFIKwRgOD9l6L/QgU+X6Ab6ETVQ3pisyjFycMa7bFhJvnqpai3ufxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="felOtV/b";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F75606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F75606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=felOtV/b
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so349543eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640477; x=1796245277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=felOtV/b3pbMZH5MzHu4ojI73i81tNEsMTtGcov8A7zdeN+muYBMAgeFIL6P4VO1zE
         L5hwDCatCHGPDJiatNQWiZfpYOuDR9OMbToDw8mQzyLSn7vUEtLW/xrSriH73mXbEqJT
         RhAKVbBKvpBnLI4kiG5dTV45JyOmqk36HA0hyGH87JxdUGwa8TYkfuK1a5TeXhp58Rks
         R8IjkiEdfCWp+7yRNbq7r3k1xpMemCYn5aI4636LsLMgl6lQJyFBwEGYLxgcKCWriq1j
         kiQn92WdMbB3QCdZDdl1YgFK/mvGiICw6jNQU9TdwJDC/PLoxwuYViIrGrSi99fKrxfP
         BdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640477; x=1796245277;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=qzQahNJmG/OTSAAyqpnykEYg0IJ6NukHEBtp42pyD0glcoiO3m3KR89sg71Rpb17sW
         IIBj/q0PU5yFTbinvbkOj187gS6NirUo4IlYebabgjbdcGZmkylV+Cosj99717D/hcVR
         5e1bczPrF7xkfEvS0DnFGqAn+hsw3a1YRe5Y6NEKRetHjMrgT3frfh5G9pbKTJAFr8fi
         ykRzAqhqCHCK3stgzPBQC1NOKyiEhfXfy9OIHhjLFUba72fVMuJ2WsSfn2PrjG25qxIl
         A4Aco/JkgkRjNloP7LqCfHinjOXdfSDxamCu9kBBzsaJBGEIWhBnnuNaXnii2Wa01Ndc
         DsFw==
X-Forwarded-Encrypted: i=1; AL+hErHqZHNyQDN13K+aiBWiAAviXp0Jo4iScM2eFxhl0bRWIjti7c2Wrt5BU/u8bCpJ9oSuK9dd7WCqRAvC3iCl1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iezAcl3oru0jEemDh5uh0MkSHK+gdwoTiJnhnR66uEdhe2lKY
	8ybDGGPnvk4b24pULMK/pplILM2D7WxUjI03WiZ4Xvy0cF/SDtWoyy0UB/vfnSed6cbmmhuDKGl
	+Lg==
X-Received: from dycue8.prod.google.com ([2002:a05:7300:88:b0:343:520f:7a80])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:880b:20b0:386:b025:1e1e
 with SMTP id 5a478bee46e88-386b02522d2mr10999574eec.16.1795640475439; Wed, 25
 Nov 2026 13:01:15 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:35 +0000
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-1-elkin@google.com>
Subject: [PATCH wireless 0/3] wifi: mwifiex: fix UAF and ext scan TLV bounds checks
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (3):
  wifi: mwifiex: fix UAF after skb_realloc_headroom() in bridged RX
  wifi: mwifiex: check TLV header size in ext scan report
  wifi: mwifiex: validate ext scan event envelope and TLV lengths

 drivers/net/wireless/marvell/mwifiex/scan.c   | 30 ++++++++++++-------
 .../net/wireless/marvell/mwifiex/uap_txrx.c   | 13 +++++---
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

