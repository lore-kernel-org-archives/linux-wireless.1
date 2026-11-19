Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110615;
	b=wl+iEi8MARbxJ+qFqH9RLJeZq9QoyTw/0YQEfhG2r/lUoQMSSY8cRjt62yRH0uZiOYlc
	 279+QLN0P9svDZxTuX9jiu3UWYbvCTj75Lg2x+XIIGQ+87l5SDgKBEKyh/DM2xnVaW2ad
	 49RKrSWylMdwLV689tqusPu1c01gRnYT8SsWIpBFEkmyhw0Gr7mf34VLXDnxiKDiYra1/
	 afYtfoVi0+nyW/7vMYAruhnmhfLFx0VYrkHeInAodOAC0LsZk08hf2XhZcPwlVUIu1T83
	 mB4GS29wO1RyO7kQ/Nx6cP/Hnbbxi9iVXwPz1yHJtCdrRMy+JvYXVpv4T7OgWy6AeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
	b=e56ehK2kB8xwtI5dSy9qEsF1TYhXLOsLKH0AcX8J6FwTvyqRVd2OkJjFshj2k+XJ5X4u
	 qZ/o3wwH8wpjLbu4mp0G+soF+jsrDHW56+HvlHEFXYhvHWNvHgIdOd78bhb6DlTOaclGw
	 93hgOOLXeeaC7VsPSiC0sc4AtuIHKIDlrJFaJ+DmFtR04PaneK4pwhNFawyTuSxCEFrHj
	 fDCKl4+BV3TmzqRUGme8FMqjQQb2W8rzkWGGzfjiAxLLuOdq0MCgNgstw+cnyRucuvfw5
	 zOR++/szVrK86F7wBtQ46HawmxtnnohzqO1kHCu+Nw99NbE5QBENCfsvaTrpFeTTEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D223260A3824
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D223260A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso2091976f8f.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110613; x=1795715413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=g3XD3WOnMdsJFDEykQoDr1yoI2Ub/9w2hyjJixXgE5sY7EuEC6aXaSUX4dGIt6DqNK
         SOHsRGi8PSmlch6qy3qjIgF7U9PrEyx/Jy5IwrJXiqkDYDivx/QbQY78tg96+LVHBKtD
         jbxR3ktY4KV6imDUzRuVrMSdMHEbXesVNc+sD4j4SJrJlCTtIC7/El4ddJbDNzU8+L7S
         yOLiDZW9FtRRJz2KmT4q9auuwU6WN+ZSLQ+aZgBh22Ix7kGanQOsiQW+gJEeCp+2I5nS
         Kfn5BrHHYT2Q4basE0JG9NfGfgEbWJvvk/kaVA/RkyaskTLPbViRN/4qaEOoLdLTYB0I
         G5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110613; x=1795715413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=Y4XEfr3WRbYYWF1TEyidxNrBUmRYlZBnhDzbJaGWu1LhyuDHVjWXOlVWqJIE5V3ykD
         5uLc3CMOfyuwTKHAdmOeHsuvwAHWC06Bs17mbe3bQICK6a7BqJ/6FO4T0fz75gJIZttE
         0mpw6KgeUoSkGS8FPsvbWhTYGaKqu/U1D6iesG4CqkQcnX6FQvxX4nRZ7ik71j0YVk3Y
         WinIj7bqDee60Yg+Y3RnMupG9Qp5FJdfP7j4AxwfN38PrAcE0lpViWN5hDU2CQEIIaq2
         fTQYQN0B5sD3BTy3l/SW1Ni6MjmckLNaSrWQhG7OMEM8n56O6Ouc8yqJhe5nm4rbA2wy
         RjEA==
X-Gm-Message-State: APuU4Z9cvNNMS4nS/iOH1CeKsfq7N0pCaLvha1oN0+uIP8W06ldtZWBJ
	iI15xhNkQihyGc2f8LwsfP75dxoD2cBalfYf62LXPpgTH3MZf7e3uylldxZOTSB6ern7s2sqasY
	bovpTVyw=
X-Gm-Gg: AZFdTZcwuLnRsySFasQAjoSjyRYugsLw34qLcfY/k6yW3vgQa0UNJnh7bMhoW73yVb+
	IBrhnv569cedwS7mgVdEoDzto357ZprrPvV3oC6sE97dxPqg48XOPtAm5VvQPlBETw/VMm4Qrfu
	O6zBOn/2fc3PdJulxbKXV3CF1/26/D9k4BUC/c0G80P9D3h8ZEQH5sCqGU0b97lFcirv/QN/jsB
	eqE5LdtCUrpmKhe81EjGl9kKJrI8Kq8Sr10NgvWXVSV/vzZWodwrgKJPEEMZ1J/T5RSVWx+WvZ/
	k/steisPprs0CifVKXEXrdTfXM02VaeJqdyyaMhdfmMJYXGesuZAO8Dbyq+XC9XUh36fZZ+4Nbs
	c4lzaz2Ez6sNC0cyejFNkBqxVlPNkmQ0C0Ra+FyoSo4PBGW3vT/BCdN1Ea9+Ksj30YROmrcjA8f
	ecqh8ivddk3Ou/59fa8hk8u8wQTKlfYqO5qY8t/1oHmW/24mbTKYUfT8wr4imjaC1ThNfo2H6+h
	4rBJOdqL34Di4BXBrZEM31jbuxnLKIOLwgcSCgyZxneJYaxnaywBtMXaokMOxvTm0nEdGtU8cLd
	ft4r//amF1LkFPzxADMHycpCZLlTQDEiZz4C/UUtwwINgjvXi+8gE1ovakWLH9ORDCtU3M8ARYr
	0l/83Q3ov4z3VUD7t1B32SsyBERNIP8NrFyrtDTgub31HSwjIcXeVRgva8sKBJPgreDaMJl9e0A
	8ddQ==
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr190135f8f.39.1795110613162;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm310363f8f.45.2026.11.19.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:12 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 06/10] dt-bindings: vendor-prefixes: add XRadio
Date: Thu, 19 Nov 2026 18:49:58 +0100
Message-ID: <20261119175002.458988-7-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

Add the vendor prefix for XRadio Wi-Fi chips.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..066c2e90f289 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1959,6 +1959,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xradio,.*":
+    description: XRadio Technology
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.56.0

