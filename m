Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.249.8.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010397;
	b=xJNBPuPgoAJ+wF94Fug08CY+U9q1yJx6hSTHh2XSjhNSuth1TgfP6NYCEWXUxZXXSLOE
	 7kLoSZFsAAe/zZsoPxMF2L01VBLHZH+nuCBW5lqJ+iiQRIFM3YodJ9bHovFfFcrG31VwZ
	 UztMrZtCVRe/U5/I2JAI+9qTGm4rywhyHqxE1u4TQek01wDZBkEtwjL4VX2/h0JyJ4o9S
	 ir03FQIfuvGYCfEB2xfTSRJDFWVpFieTXOTRSUeYazngEqnv2p3rCD2aaeOC879Jbr56r
	 t0JvhtEdy0z9J5qun3JAmE4icgOwfpE9dZ52WoJZc9Gr7zQL4gZVg8QoeyE1wsTq8wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010397;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZAvv1Z1NX/RN7EuLZj7pKh7A8i43+V6DfmfwNYrQhy0=;
	b=fZHras01BxVNnlgPBgA7FyJa1huGH+kkFxBvKPT0VNtFia8cvlh0HgcQYkjl2621grr3
	 Y1y7P1ME8+QDvSGwSA1y629TQTDSaRCRb8MTRsuivah5ZAlkucRVXikJHMkmheWek/KmM
	 pHdhsZ/Gvm9cKbVFEtopNoFhrNwgj9d2sQnhkPAEfNAWTVjBEklFPecmdOgA3mJY50Arl
	 S8qWjaoLYjYxYDkERAmj96ffagiW8STuXLKtnVxgKMNDHsQiEjkaNIRkSUj4KK6R3KRFT
	 tkQ3kALQ+07GecOBdGiZu16Wslge+Ys/k3JWxpAs6GQBiKWp3XZMarUfJ6S2l2OjYYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fernandotapia.eu;
	spf=pass smtp.mailfrom=fernandotapia.eu;
	dkim=pass header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=BX9CpRDj;
	arc=none smtp.remote-ip=173.249.8.110
Received: from mail.fernandotapia.eu (mail.fernandotapia.eu [173.249.8.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42AF606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fernandotapia.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fernandotapia.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=BX9CpRDj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fernandotapia.eu; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZAvv1Z1NX/RN7EuLZj7pKh7A8i43+V6DfmfwNYrQhy0=; b=BX9CpRDj2VP5q4JXdncdv5UnAw
	3TVsBQzxFehiV6VDbtbWbx6ObWH8ThRK1aPDOluBb2NUCiVCANm8+q2rwEqyVn6jIGr+wH2XRD1yd
	6c5/SxE4p8XLDW0JITCb8AkB7S6UFVerwKr9g1eiDW/nhkBf9FloZhXVsLe6CsJXX95Sgsai1puwD
	4DGPHX9xMhvWKaqWgYchrCkwzkw5+gJu/ab5NQQvvN6B5SbIlAeIJEpyfHg5ow4ZAdxgby+cBRug/
	7iys/FnlwRYV2GvIowewX57/9zZKWd+l0mRhpnUxEYXCXeAz6eTXCUs6IALrSMggS2Uu2Ew6cBbYg
	b+MAeMoA==;
Received: from [86.127.236.214] (helo=workbench.lan)
	by espabilao.fernandotapia.eu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <fernan.tapia@fernandotapia.eu>)
	id 1xTgCT-00000001CDh-0a9P;
	Wed, 18 Nov 2026 14:59:49 +0100
From: Fernando Tapia <fernan.tapia@fernandotapia.eu>
To: nico.escande@gmail.com,
	ath11k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	repk@triplefau.lt
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on the same pdev
Date: Wed, 18 Nov 2026 14:59:47 +0100
Message-ID: <20261118135947.24335-1-fernan.tapia@fernandotapia.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
References: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
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

On Tue Nov 17, 2026 at 10:04 AM CET, Nicolas Escande wrote:
> Even worse, 4 patches in total:

Sorry, I missed those. Please drop this patch in favour of Remi's [1],
which does the same. The same check fixed the reboot on a Xiaomi AX3600
(IPQ8074, fw 02146).

[1] https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a3961795.1784792420.git.repk@triplefau.lt/

Fernando
