Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818754;
	b=gyXSjMVguwiinvde0bS5rsfLEGAStsvThUjt4cpFTpJLvCkpqM4/oNlWzfdYx6EXH4dw
	 sRecIcAdjbgquzWZ01xPCrXWZsTy3fuEz5hCyD0NDRt2Y0bHz9dUDZKCS8cQv8F0jBSSN
	 4S6wlXSSlRdJWSTiqoFDqcxAGmiCYvZbanFau2j4Efr7gLd0BdzmldmUq0oIs6nOqvLdn
	 yhbzkNo8aj1V1fAcnXQDYlbOBkW5lVsLHYfELAV5lKMiRs49wLCDkPZy6edF4osrsgnuw
	 tpDk/T4F84dbrYDPDL+UyS6i1wSLdDx4SZssCY5/5mBxH++X/3LGVFupdw7ezanK+dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
	b=g1y0an5wHdsa6LYIPqJL+arqiV6Drq3gGA/JCS4rm3ffqqxhhxZHuG6H8rsKWl6R039q
	 VdG8xUY5hdHKf4DCT0AKWpr1PQKg9XLBhus4JG6niZHulMSLYdURBooJX+X7MvUJ+EI4o
	 e2y/Aohttviu6Nu1vC3RdYVMKsOiuJl3xo72XMA2FqZRi3SRqTUe2raNFFdpucMNXcHrZ
	 9Piv0Rmv7JBHlp4SC1VV4gN1qiBliLfgqVKp8vlmBUuicfwjLqGLYW5LUCqMZkRCQ1kzQ
	 OFswpjM2yab1sy43cYQymGTA9tg7rFkQTwara44Li27/5hXNhVVyhmy04s9rOE3izug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfWCzUD2;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38386606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38386606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfWCzUD2
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1550136a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818753; x=1795423553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=mfWCzUD20XoHTyhJrdA/ZDc0C3u9p2/1bR+BOIRJx16yop9RgjULiJMtgbNWldqAgl
         blLlA0yfgMsq8dZhGIgTYdu1rMKbEgvp6dsEh7HCpaPuvhVo70fxBYdFrZ4Rngl0F05g
         3uj0to7InMh4/RJLqvCggt3QRft70z4gYqR/cNexn1AdEfcE2w9QUozPHe6SIaQCFdi2
         +Dz4KSgYFPLkCeYt2DfG4BGRSqzt58qy28w+AqoY7OdCjZ1eoqWL/umK1UduZUI8gmpP
         V87j9gnCF820f4ijVeh1aXgZ/kg7JNG710CYOWus2ck9pH1RyDCbLyeyqEZmZ2JpZFLg
         1n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818753; x=1795423553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=mqNCLaWk0UTJR76ZSAlizNsfklbLWMkaHDhn+rNLMtk+Bqddg4aOWy/H8OPawUArYI
         89K8c5PQac4F1WOyNAqnYE3g0UsVtotIyJcqzRaw3tMQFuJClwtHq6Lz1tXDs/7l5mWW
         Oq8h5OjRA05VVZ3c/Wi0z0PgKg7863KBql53fSYUOm7e7LUR5E75JOPapVcdjKpJLsKw
         MUWAUbfORwXYYLbuFvAZiOzcv43K1y7ZNywDBcvLmEU2EMz6cneX2STQQDrSwLJOSm9q
         nC+UytS7LBqtcK910x1KM5/ZyLlebyuAgPzQCpxSzISpl7I8MtY4n2ej2qDBFsBrhuK9
         jZjg==
X-Forwarded-Encrypted: i=1; AL+hErF+HuwwtM7Mbp54iibpA1+xwd1u18Xzf4RAG9YnxdC44AJZcr98tQSCgiRhComjASekh3SMAtnhtEaPf2mvqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z++KmSrqSbLRGRoIoh8vp+miD7XK7v/fepIBQFO3iCICkrqnQ8X
	AW2lhOrM+cd8e5Pyw85zkpoc35XMKGgiv/Vf0md77SsT3ClEYn6BZSHK
X-Gm-Gg: AZFdTZfXhT0sKvmugaC1esesgFI9qgy+FovtaHPdG5b1F0cobd0G7HBxAf1nQwVtGIu
	iR+7OK3C1iOPCVAt7nxuYUrFCajc04Vml5zB9ksI58aSIDqZNMOpTy+M/fJJAYqJX4ulS1PxcvR
	E8bWTMN0+CQ2UxAciuQ1kH0WeARpKw2vtM6CcANBPQsTQQrsKV/lQsAmnko3SIzrLPRkkeNuCiH
	phy+Hn2BhnssPjGnP5Eg90EEI1eNuhhI3Jk0yAoKHcVa66Hj1oXwcrekbdrkCUfO8b61wV2iiM9
	2pnAIL541KoZM8ljCdJMt/zQ/Zv4teN6yfV0KNtWbQowze/+C6zYq3ALKw2OZukTU3TPCqS7Ftr
	Ol1dVpTimmvMDvkfLvxWfjsqr483eN1NQeGF4d+qRD5lHodb44fmA+V/ontAE3fgBgeQOT1eLCV
	4SMxnrF0exnFlSkuf9o4/aO/8sC+h4lfCKojzvFvv/LF4xn6ngp6qw1scjkJzp+4rhGLDh8ItyH
	tMNg/Qp7aeQMYcrXEpelUmNnnlEPAZOP6C+oecKJffel01hBY5vA+wbU3t9UH/oWB6E1oGLqc0m
	q/z1fCoJuzcsQa8k066WjQ9pjqpb3KL9qtYQksyz1PCUgCvMUGU6msQsCTA=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6437149a91.43.1794818753152;
        Mon, 16 Nov 2026 00:45:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8861987a91.0.2026.11.16.00.45.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:45:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 16:45:22 +0800
Message-ID: <20261116084522.88724-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116081440.1011837-1-zihengw03@163.com>
References: <20261116081440.1011837-1-zihengw03@163.com>
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

Hi Ziheng,

On Mon, Nov 16, 2026 at 04:14:40PM +0800, Ziheng Wei wrote:
> +	/* not every WTBL entry is a station link, e.g. the global wcid */
> +	if (!status->wcid || !status->wcid->sta)
> +		return -EINVAL;
> +
> +	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
> +	msta = mlink->sta;

With the check ahead of the container_of(), the global wcid is rejected,
and wcid_to_sta() resolves a secondary link to its station through the
def_wcid that mt7925_mac_sta_add_links() sets.

Reviewed-by: Zhao Li <enderaoelyther@gmail.com>

Thanks,
Zhao
