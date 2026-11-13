Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794590889;
	b=ZIbYRqTNZwQ9kFS79hO+ZKTChwm2R49q6gQbKYhpqvi4ased7eRSNebehXMRXFWTlj7G
	 zcVomMNfnuSSRpc7s0BSiEFJIEbLRxhu7+dNWy0grkvpE+PfAKPOS0w8OeywzfeUWW9GK
	 y6ZPs+WKAtwqKyAe04WIEKxzzwpHus9EmqhlS4wDuKbJn0w5LJzUK1fXVOgWLYsvEgIRG
	 8LIf5ScpGUsGvg3el46SxUcf+ITtMp9HaLc7J72aDNm2XumolKelz5w/Vlh1D5j0fMCWg
	 TffBi5C4/VB2HOEy0GXE9Bpgw1PZnBM97jEWtqX8EVEvIcOnieGzlDEV7NzuvfPOYYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8g4+3asb8Iuk1LfooCJ6bahkJm4TLY1wfISHOzmUnVg=;
	b=2ca/aXxbFd1eJ7kdH6tR+aNcwIBGVs9btddCAJ12XKwa3bEr1h41XcxdvmGeXQj9vXV0
	 MpxqZnAK23A3oXwg9jv0YVReEyKu/2L5ExZaJKObAQqMsnJJrjU0gNT9UTRooRqv7cRZc
	 2+eEg29olm5CcJVPBs7J9N6GIwnWfj8A9rPabg+M1yPOvVj1MI6Sub//5/zT/o9VRpDX3
	 Sp65ICklLFmc7RFcuIPNLet/w4SDvXK+mW0Cbsz10g6cLvjawmUbxkE5BGhLxkBD1cnUC
	 geDY5N6doASJXoZLZJHi/9wQ9H9bm6mvyiqnviiZ8+baBvqam7WbDMvuVzB1PUlZIsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yaph8Wpk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3EA606D4B3
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3EA606D4B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yaph8Wpk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so2614322eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794590888; cv=none;
        d=google.com; s=arc-20260327;
        b=mOoCUiLKk2Slpn8eLVKxSo8MD3icL0F7nlcFnTRvzA9EibtTVfawhL3ekkiEABpB0J
         yh3wcuHARuzw3pZhrJQ4wHdz2Se8V79Ro5M9kwJAyQPWLQsSqfgeUWFJqRmj3/k0uRaR
         ROYSOOtLbvzqU9pTDFRU8DgIjaT0Tvab9FOnC5Ne8Jq2f/1GxhFX+6lRgqWI7YkgSuEv
         wfr5kaxRXfAqI4iKlB2y57MFDiBGCwjRlHQp8rAaALiTWYeuE+ZI2ZnaIV01AM6aAlYj
         bJ88rnlrA5dSxz5cruEvg0oC2vZGSau6NGbvrPJ9HwBdTFLK7Ww3dDLEsLGu15ADo7An
         df9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8g4+3asb8Iuk1LfooCJ6bahkJm4TLY1wfISHOzmUnVg=;
        fh=zI797sKMmrwAi7OE/g03p0HulnzjvobFzmVREugZGGU=;
        b=LvwV9wNnEf8KRiQHy1EO+XANp9W+VTgupTWWznG9PwKhumhgn1x2cmr6M/ZDDaKqJ9
         L5ROeRdsOJkrsKja8g7/6LpWWvlteCyRpbIIIbw3WzKTY6aznk5w7XBl67o1n7CzrnwR
         wpmqYMO3d9ma9jND9ptvqB7Wf9qWCGxf8mL/PoJ4N8JOfUJnJWrfi3Q/yo1kWhfhDIsm
         JzZmt2C6DnSAMBQUuUz/fSQbebxhbwkXjpk9g4ruCOF6KFBI4+0hNV4Ipq+j7+aj1Nxx
         vjc5ZwPIf4I58qo7v/pyoVSjCvRhgpOPZgM8WiMhsvTtY90f2dMEAHkphdszREq8+INu
         U4rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794590888; x=1795195688; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8g4+3asb8Iuk1LfooCJ6bahkJm4TLY1wfISHOzmUnVg=;
        b=Yaph8Wpk8mG8HwTmvJfyr7QdexHmPRO8VxP7ADet62vC3aqLmYK2/mnGXGvU79dlq4
         RJxdo/8WhYB5O2QcHKjkG4Qa9tU8lVLB2dwLmNnZJpr32EIVZ8x/jXSpKGUVT0pqHMbT
         wMxgDMJYe0pImSzYLSDs5o8+xzXtm6SFYh1lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590888; x=1795195688;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8g4+3asb8Iuk1LfooCJ6bahkJm4TLY1wfISHOzmUnVg=;
        b=n+kOhIK18TwV5Aue1mtn9aqFoaXGAFtddyQErwpCMDwvCF3HWD8yxjPOLj3jKToTr5
         7gCcIyRtLPvHQZUEytozrAOFrUTFKEsJK4T3S39kzxCNJU4bsGZhA5AgO9SxKIzQCZ0A
         yDQ9f5dX8pI2kmW3EB9jE8qcKWPl88mkTXWz5SD+fGq9oawNnrtCqDLt+y230HNIRJXI
         i7Dt5n4oS1zMckX9aottxYIcjoX5Sf/xA/BuTF7WV0IkpoT0foBdczA3ZMsAxOZL7OR0
         3x1V48k8eFNMx0yazi4rFPoxgzmsdLIXKWQeeNhm3lPdWiPrpWdrb+aXLd3MppXKqHI9
         +xWw==
X-Forwarded-Encrypted: i=1; AL+hErGUph2PdKCeBsM16YLO6P/AyWPWbLe1cOBWUFehHqXQnWwwryJTwLpGBM8vyHS9w1042aL3QPXfv9Uwr6/T6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xLIdzZhCFJZEOgTH+iIBSCTOvUH6N/s9G25+vQWIx1DzfwQgc
	RE8kD82uTesMVWUOxPgCZ9eQcdgI+IJBae4TsLzsQq8bK0UlnLjXDRib4nZtzC8+oDeqWoZJKxC
	BQp5QKkd6SmeO84BY84rDBIfZr4bMKwDMDPvIXDpA
X-Gm-Gg: AYBFou26wNtPtOZ9U1Axdzwa1RGvqU4NW1UpSiiarEZ+Vb3O1yzyv3x1eBH81vEEYwt
	vhEcDTorK7Y6CE61FRbc5f0KkkKA7MOtlpJpBp1YxgEFH76oTEIq1z2yyZNa2ASvXDjuU8rmHFz
	ZyPPhYYdBINmIMm/AuHNLNdJ226VM0cfeIr9+eUTWC1AGIl7DCHjOloCjCZUD6JJk8g+ygTFLvb
	Snv1L86FK+Ekfh1evqL5T3BCMdSFGa4UV3v0cYa1ky6Pd7HLI/Tk6jVXX+kWCoYH2Y3SJlEV+rG
	UWDx63+M9EacYVGCyE7P+Yt+ic+jqVemvp6Dx9oOfKOndfTHdSjdEfo6NjUce2Yq62Pi25SvnkG
	ZszkF474zx6PS52Yuz05cTJkN3U/YlmuPj3oUqTzNgCCd7tGb372GR37kivLfQ39SOZ3Y3kY=
X-Received: by 2002:a05:701b:4544:10b0:1ab:9742:e860 with SMTP id
 a92af1059eb24-1b4f5f67318mr5082057c88.20.1794590887761; Fri, 13 Nov 2026
 09:28:07 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: David Ruth <druth@chromium.org>
Date: Fri, 13 Nov 2026 12:27:56 -0500
X-Gm-Features: AclHuK-qRtk9mqvOrRh9SPz51JfFNZMChDx1v0-4jKu_NLpTjjJhLXJ-2y3euyI
Message-ID: <CACr5y4pzM61tvyyOabqhmCGhBO40VJ=k-KE1fA6prEHVvQ_c5g@mail.gmail.com>
Subject: Re: [PATCH v1] wifi: mt76: mt792x: Add MTK OUI support for wpa supplicant
To: eason.lai@mediatek.com
Cc: =?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <deren.wu@mediatek.com>, 
	jb.tsai@mediatek.com, kun.wu@mediatek.com, Leon Yen <leon.yen@mediatek.com>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, litien.chang@mediatek.com, 
	Lorenzo Bianconi <lorenzo@kernel.org>, michael.shih@mediatek.com, 
	Felix Fietkau <nbd@nbd.name>, Quan Zhou <quan.zhou@mediatek.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Given that this is a nonstandard vendor command, shouldn't it be
behind a Kconfig option so that users can choose to not have it
compiled in? If this is for Android, maybe something like "config
MTK_ANDROID", if it's just additional MTK functionality, "config
MTK_VENDOR". That would at least allow users and distributions who may
be concerned about the additional functionality to give it a look and
leave it out if they don't want it.
