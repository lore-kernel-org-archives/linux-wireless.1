Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072283;
	b=ZD3DP+qJF8B4oV3/1Mi6JqjKUQgs0Fb6AEuK7Uu+Nt85aexzoCzbXKUK+OuOy61XSxad
	 jmTs92MiekbioemO5UAxlZo/W9IiPW1KLroO4o2snnfhIJc44W5v3KF/KH/BHpDg7e+qZ
	 yggYUhCPKZvByVUm3Apyqzh7Rdw2siM/2VsP4llfwTCfh3GPi9uD91S6/W0cGIxZgzaCG
	 9O3rtuHgMXiUDiAuTQczF9jVj75162fzs8e6jhomoEprLbSb+DViVG8iwUegP1enCGIEH
	 Dcq4lnpONTEw7/uLuRiUMaOTWYY4BWT0i3s3sT5yh3Lo0Z5Itw4+D1+6nBssiMO0BxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
	b=tH6hL0VNI7rKibz05K3DuaUt06Jy6+Z7iv7Al9gg2HC5Fi2N3knzAxJQuSNSW77IaoH8
	 KGnD3pKDyJ43V0A49CQdjhFLjBMfIcvVmL/3ZNCHd/36wwsRslFpramPaxQfkDhPjcDAs
	 gd1QEvXGMJPi8B8G7zVF3BYctC+eUGSVIgap9Y+Ths9L8Kh6HNPujjlP+zb/u2qI2ojpq
	 lrZAPNx12H2L6BoJVF/KilhKDzbtC31RGQUZ6zeaiKOVV3sRqrCIbEDlN+h+99EV6y0Lz
	 cEiq2iotKuYgp67F6vl1iVXDahJh1UyoNKmuNNue5bEDjunp5x0bcoySTPQssMbk2CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6rGyArh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08DD606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 07:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08DD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6rGyArh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so16197535e9.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072281; x=1795677081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=s6rGyArhuSERmUnH60j+FCU+u9jGED8Q7xAtnZgm1V6hoIo4R1ChY6wbnox4ETuCk7
         /cIk8rmhMXzIl/Nyetbo3vmBZQ68waP59u1uivpNP90WucncAw1Q9hSWaRASB9LMV/bX
         zNiuAoI5Mjx/RvKQculPqpqeqWii2f73A1L1ykCMs5RBRhFtTKWemMNQtqKOmPSfzZro
         8InXRKRvbKeSc+kCqVBq7A/wr6oDQk2scwB+ArEzG9DXATWbbxmbC22Ya0UfFJgJsF41
         +Y/iQR4zCJXXfVl4MbzIYYpV0q0z/PjuIkOFFEFcD9VUGDLchCLDR1l3wm9nWjf4A5v2
         sM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072281; x=1795677081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=cWj9pJXk9/WZ7yhDhJkXocWXa+LyVuxVQzqXxcdj3HPndY4JCwZKbmstlEIMx5EaWF
         lO3LiC3iTUDsf8dTxtU0DFgBjgeKAOJGr0saAuxhZjWScW14o30pJjDjNrXCCuoSNzzu
         gNLVcaQaYI4EI+SeLLGw8LKLoQNrle1aD0SIJiooOj8H3MiZ442U4iP7pDcTiqy9dxG5
         EUTSaBd6dIX/N9zx7qR+hQUtthVt56Il0lt0J6PKYV1LvS88S5/ONsDZZlzMM/LpNSHu
         eHD2KR/FqPEi4Ey2SM1qPWg4t4jnAm2pK7+n9LolJcXGzC/SqRqLFV2AqTpQ0LOEHn8Q
         5Flw==
X-Forwarded-Encrypted: i=1; AL+hErEH8nZdf/VTv3LwJsMDXlKBUKznqa2L7l/3WIEGClO69zG8g/BV6YWBz+dDNmZS/2tSonz3BHptVZH/h4kyQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uyFydyix9huLBrhAVzCQQrl4behlQdinDwHhfrsHVFYHpvRUI
	HD2eX/wp2TGeh2iWvMXUZDefQJOJRR+/+a84bOSoavJCLFhGHJxDMjld
X-Gm-Gg: AYBFou08XnGqYs98dWyuSKPy5DBxEoTa+EZjAe9XZbN8SH3uTxGUls7/iOnekbKlSEz
	LlfZeE6SwP3cA9RGzEHCS50WUM/OESZ4Q1RGu6tWzRZ/dNxMIyVsmSDrgx6Ff2+xtDSnHBCqsBD
	dK9ls2ecOaLd197Rfd3fG4UCWh/xqTrwchscbRBERAdjF8mPc92q41a8zQUPQyZ1TByIQo8PRTS
	VcsQBw5R8A3Z5BoDxSwEP7rA2PX0imxJ7EY8ZmTnTh17EdECm5aKhwSNZkgQ6zrr6rDPf30lhWU
	pwBPuM7dv5upLktqghFFTUD8usn2Fhx69h8SuvGhZBWXBBrVDx9LnMtL3kA0Su03q8MRzyct4p0
	kGvP8Kh9iEn4NaEKiz2i+W+G7VZDqZ7GwkRLrObVMkuX/BrZ81j1UcgR6HQ4JTZNarR+2BVC4xf
	0iQVTPchME28tl/33IjSzK//z0TJ+NIp+TiR1xEhdMjHh0h9Ni8b4A2vFScMcW+mLBeCfZvxh3C
	dDyPoezolhWh9PK0VYz2WfZLrjU4m9sFMHbcGV7dR3GZVQX1CIFq8wmhc9gbEEe/LZkggcvfF0F
	8byzTFHhjrCkF4a0e/aWzl14dl9Nh3qRPHMjaXYSadY8CKd60iL1wiNTHRNiUS7kckFpjPb/ydQ
	9QawyYYSFfXbe4lzgyFD0R0Xsgce4IDNTKnnz1bZg6T5Xz8TzGoe/CU2Tjxun3PPD1AMKjseLvn
	NF1BWQlhPoXzvCBkfmjpbTHUad4wCT7jurh2t/qKHzJBOc6tfbPovw
X-Received: by 2002:a05:600c:800c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb7da3d581mr99024035e9.35.1795072281098;
        Wed, 18 Nov 2026 23:11:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-0199-55e2-7041-f103.ipv6.o2.cz. [2a00:1028:8388:a84e:199:55e2:7041:f103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm8676988f8f.4.2026.11.18.23.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:11:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Thu, 19 Nov 2026 08:11:18 +0100
Message-ID: <20261119071118.78938-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
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

Hi Felix,

any comments on this series? Devin tested it on wireless-next and 6.18
with two firmware versions and sent a Tested-by [1]. The series still
applies to your mt76 branch.

Sean, JB, the question from the cover letter about driving GPIO 8 from
the host is still open.

[1] https://lore.kernel.org/linux-wireless/20261108190313.11505-1-lucid_duck@justthetip.ca/

Thanks,
Josef
