Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426345;
	b=upfB2dRdiO6WFZBPFqIL02QMg6uLsY0Aff0dM1yxV7zKV0y3uI7qHnZXWwEOuCVJ6doT
	 aYaoLU4Vccf4jwp5Mtj73jY6nJTIcDde3fAMbGLBj0LuU2J/DH8nNmd+PToJy0cyGCYEj
	 lw+rceUa9dvZLrvnPL38oEdidbx6BEKKzmNgn3Own8w27VbX3+jI9BxdukLK5cnYITQqv
	 JVyruY0wVyE02t1IE1+GIbfxxDMsAoftEcpk+yyak68Vs5IetunpG2qkQv9y8nnDtIm5g
	 QmZtzf/aKfH3PhwJO7wQYtCaAMJODqAdFkCjhCyv6ICzuESFGU1O96S7zcUEzD0l2PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
	b=sqX0mpRKqb0hupCXOQ94wo9rJ05le8/SKPrTsxUSfokKhFiPAxrLH6yw+I/25LqrIsie
	 PWgaS4zaEoIiGcv4TT3z9B4aFjvuRBvO78NLD9pBQoJ3+N4Egh/aqeBIPBHbwGFpJevZj
	 9SQiYSLccQ77uJVuvd2qdbGCZ8cuad0r3tdj2uhUDxa6hahyeP93+PLDlegbYBp7tb2bX
	 p6GTKH/hR9DPAqvCu7S4S4z2G6ytUPu4jhcbNpiZOCF7/t5AkwUC0gtO/YLaooGYJ78rq
	 M5t9J62n0gBXfYbfqE3FCrJJSaM4PYwDWCXbToSLsiOat2fn/c8z2BYLVSLTwDIVneA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2SQADY4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E5E606A324
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 19:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E5E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2SQADY4
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so1135852137.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 11:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426344; cv=none;
        d=google.com; s=arc-20260327;
        b=JMe3h3QrCjMgA0TPaU5N1dZ6a8bEBTuG5PSowaC7QC5MIt/h4Ei7RxtWUu5ftjqNsQ
         eX6qsCTtdHH+ar4dTO4g986ElhuookzqbS3Me7I3zv4TUfmU2+umA8t6NtAziFmuZ+G7
         d32RoozUnH2mpAVQGQYwRq8JfLqknSRZ/bw+DgNvgd9hFt35EuSHeRU4I1XT8CroqDkB
         ygJOn5wDcmxd+5zdlFCrUUS3BN/75UFQMO8lwEvLT+Vx5LSYfF6TXZht6IledopPYo4j
         BKJtwoc1stxSw7aSomnpASIlrXXgEL3S+mrRQXj7/US5ZiQFQRYZu5htx0Pp2dJn41NG
         5krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        fh=HOTZnejzXPwwI9MqhEU9gSe9I0ONxmlKU972PgavKJQ=;
        b=aJNoyegAiZiPfCnPTgqFQYK6ulzBFcM/YGowb5C1BaQ7laKrbFlmIa/mSmlJD/g4cx
         xLX3MK20+jPuKOFTVHwNE4jIw2aDNlL8nDuK5+igx6mJqFSAL4UF7TUmcqdYx2yVPQwG
         fL0NZF3OY5Mw/GdYzXTASuGeKY1O9lHL3pDLd1XP5BKKaVDZqcZAsXw7Uul98uy/8I2P
         62BJeVj8LuwJLZiZ/dCy64w8SgwLdUuQ71wPY4DoYhBFmFZ0YmNtIKq9tu3M1/gGkZrE
         PR1bhXPR21aSj5GqJFMozdeFN+seqgugFjuGHWEF4nZAzdVAnVvrIK9Yu9CRrHmtk0Eg
         RqHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426344; x=1795031144; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        b=s2SQADY4LOfmdJHfDSvArtdrTeHBAS6GOBpELjwBCpCNvpH6naC/dcKs4byB7lwQih
         lqdEQaMgswjGDNm9o7gStKrqov+X6daowptmi4STP/SO6ZLjO2Xwkeyq6XzIt3wpYfb/
         wX3edTaXNQ9PNhBqJGHuCGjUAV86DVgmu7OZv+X2HmWUAj5RerEMECumzxt+nXodVZLR
         /R0o8YKbe+ZDRwLG4eyQOFITNBoppYUFD5LTuA1U4+NJAuQ7dvpTp7y1IdVZis1JJNRE
         ITSHVzog8tbzHuGtrcQeocPXCbHMkj7nsYn2zuTdzWnUwjW5mjrwVHU56tNwiGpy4Qec
         Hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426344; x=1795031144;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        b=pbUBQJJ1px2rJIqfKy8rBu6C3Tx09sHZdTtHptLPwfK/WfozrjHH2wHBxe3DkK3rB9
         +bE/akI0VgNwFGauevkQ+e/hzbQYk6jSS/7XfBhGiIabtnagjpqMOCAOnp/snyOzyyGq
         DygKx9FU2mKG4vobnkM3dw2RnnKuyDFV+Q6Xb3iNQTj0JzR3uQUH6zBdVMdh6ttcjO0l
         XRlujY6vw9gyyI2fMgygqTpYIejmYxoXrQ2funRkAniOgF4RclqA6ouwBoDfOj83Rw5/
         7Kq9GIui5aVNiaHiCET/T/t3vAhLwMa9BCdZm+0Osp+UmPM9foXbiuQUpGwYXUeojfdP
         IEAw==
X-Forwarded-Encrypted: i=1; AL+hErFl/ipHQpVVTIBU32uLsCIpuBzWT4YxIR7GZejtrqPfPOA0Y3EovdDcL4vI2w9ehyQ40MRlwzAXGiUoOcZ4hQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z856lEWWprzHVzdQC3OiUze0qNeRQThC+8JWqEf3qiDRuS+z2Xm
	dxEjrhg+o0bgMEzOGIRpfO6LfftCHwVGcuDtZ0RD2blCG7WGMWJBQqjVxOpf9ps87Tq9fPSQfPQ
	KA8zfBCz3Iofg1xemk0OObJDIaGQI2/U=
X-Gm-Gg: AYBFou29MtzMc7KpeNcJFGdl0sYJwwaJu08VeKT8o9PVWL1xxxKQqQ2srROpGqVLrtf
	unQwOcVlE1H5NE8PAGi7A+wAZ1YTGBkj2wWHIG360/Yq0vaLmmk00uQ59Jo2qmnhEzAlxGRukNa
	JTUc1j2IZBQzczddHT8F2sLCtqdDoSws34GY5LZ748aGzzEjXEOQ3oqtjbnLzEFNrFFLYzGAcU0
	iEZNAbguSs6Jk8VZIrRrD92Z2epybUq+smi3v++S/8NmXbcC29IMDrUWjTstJhaxjnCByBXh6t/
	iXDihqNlqJP94kdJaMRt35CuFpTpnubJDw61wg53sZmanPmPEAdJ7SxYgxoQLOKom+XuiFAKZ0n
	pSvr/ViFXEtJWLqXl4XBdBEqIJnb+rSL2MktO
X-Received: by 2002:a05:6102:a4f:b0:7cc:9d82:ae17 with SMTP id
 ada2fe7eead31-7d4fb2d9f20mr1247064137.11.1794426343023; Wed, 11 Nov 2026
 11:45:43 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 14:45:42 -0500
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
In-Reply-To: <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
References: <20261028141751.6728-1-enderaoelyther@gmail.com>
	 <20261028141751.6728-3-enderaoelyther@gmail.com>	 (sfid-20261028_151822_083722_A5EF7A18)
 <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
Date: Wed, 11 Nov 2026 14:45:42 -0500
X-Gm-Features: AclHuK_498F9mVKuehZNiursTJcACe2DxghGvso4T8Fz6hgolPYVL93yCmoCmV8
Message-ID: <CACHPgzw-JeorCAX-b5jjd6d5=L0oYpPdGtstUSaz5sPKZE2HsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mac80211_hwsim: serialize radio removal with
 frame commands
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Javier Lopez <jlopex@gmail.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> That, with significant work done under the mutex, seems like too big a
> hammer, can't it really not be done in any other way?

Yes, you are right. The global mutex is way too broad, and I am dropping
that approach entirely.

The underlying problem is per-radio object lifetime, not command
serialization. get_hwsim_data_ref_from_addr() returns a radio pointer
after rhashtable_lookup_fast() has already ended its RCU read-side
protection. A concurrent deletion can then unpublish and free that radio
while a frame, TX-status, or PMSR command is still using the pointer.

I reworked the fix around a per-radio reference count. Address lookups
acquire a reference while holding hwsim_radio_lock, which is already used
when removing a radio from the hash table. Deletion first unpublishes the
radio under hwsim_radio_lock, releases that lock, drops the initial
reference, and waits only for in-flight lookups on that specific radio to
finish before calling ieee80211_unregister_hw().

This keeps the expensive ieee80211_unregister_hw() path outside
hwsim_radio_lock. It introduces no new lock and does not serialize command
handlers or the teardown of unrelated radios.

Since patch 1/2 is already applied, I will send the replacement as a
standalone v2.

Thanks,
Zhao

On Tue, 10 Nov 2026 11:54:21 +0100, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Wed, 2026-10-28 at 22:17 +0800, Zhao Li wrote:
> > Destroying a radio while a frame, TX status, or PMSR command is in
> > progress can make the command access the radio after it has been freed.
> >
> >  DEFINE_SPINLOCK(hwsim_radio_lock);
> > +static DEFINE_MUTEX(hwsim_radio_mutex);
>
> That, with significant work done under the mutex, seems like too big a
> hammer, can't it really not be done in any other way?
>
> johannes
