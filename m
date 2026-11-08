Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794099918;
	b=fv0f86tkxzj2NiZN3HtZTWodbwYyQJmdpDM/eqg4JDgVkla52hTam195+tsX5jWmshgT
	 uppG2WYLxTnGRYiK0/5ubXgkjpOXTcr5d7cOovxCkUmzeHMC2hkbNKqYnWQdFFXsNju7M
	 FmbCzomeZa8u1ivU4RAG5l2rcUi0zGmGVOr3miwS5Km8GGSU1VW9x03mejuEBGX1U4oXv
	 LRga6xf84sYOGhEjIsmK5OXitnY/ItgBdY7wMEahxoVXffIcYdtUTUFEgyyqqFDQB2tVV
	 FX32b9Db4cnaQULzfBZf59yQjjKBbAMAzEmiUe2fKqWziiBBCD+n/vwRSCW+ZhRV/pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794099918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
	b=P8BClaCHxwYwtUzeMscCa9/loVpzyjDBPlC+eD3ocYgCvkywJbLX5hY2asRxZrJ9mDzZ
	 r3xuHQgIH5eWsN5mILWaJIW8vqR503kyFy/4cMFaHOTULNGl2H5O9zRvIwPYh+XNUpVDq
	 nglXiNnMPSB0sWxWPzDEHVTPZ7M1xZuxCjPXW6y5lvM9oSbP3Yh4S+8iROH1ctJDtT06p
	 prMhBoILNnxoQG3ePcq/rhv2BrBaZlPzKmlkun80hn6iwNXYty68ttmgtyHCh9tSo6xRa
	 YLMWgcelCj1WARNW8p9cBaPCX+jVyrsXWXukKJfntuUHoEe03yY8d2wIJEm6kNFy+ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxJaP07Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D01606A326
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 01:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D01606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxJaP07Z
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7a6e560f580so101120137.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 17:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794099917; cv=none;
        d=google.com; s=arc-20260327;
        b=pfspO1+EdeMxB3ANbSYzhHPDyF3KvlHDwpCF/fvoI1p1zJLfbxL5RXj8N6cqj0e16x
         EgsWW2EynBhBe0FaIxdTZEeQz2Yn1CDSBe1TJydXdqRMYyFX5w4GGkO3OeNUTtsAaAoq
         om15THpQy0oAiALG+kvE5Cz3NilO+Esljqz+prhkxETcurgV12AnH72mh5lhPP4pqTGe
         MEA3oX9M5uJS1UanZHA318Sii+CHTmgb4aLlot7xv8d9z4kbYZkcYUh1apmvgRXgcmQ/
         xsdDscLaLaBB6NF13cpbeMdTI6AsSo76fm5MDJHCNXP2VyRzh/ykykVut8GZ78wVXO3R
         TNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        fh=8IAy5qup0a2EY8QRGpBSpKR+Jn4fWjWAV5x6xozgXOQ=;
        b=ERMxXmdrGr1vsY+xfxqOae2G15lUyPPE3h8LYH5VlWdwWv8LMuZ397vHOw/FCXEgPX
         5FCIkNn0deyRq2q3KA/WQfq7z0MFpYs+6VeHfeOngwDArDhUKe1ilc70OWMCecYThVTs
         ZvtmyFlOry2TN3kByJQK34h8dfTgYVEA+le+Ny7RRNJQxJQvlbNsZ0a1G61kfuTJEX2Q
         uCT4JhzEapZem0Ep/5J0zMh13DIVuYTGC219jZeUaS5fv6y+kL0cTfOcWwHB0KLRkPI1
         kFMAYIZYvO/TlZ6Vauz8HQlyxAMKB64MfKkkpjoANcU9/oo7cFrVGE1DBN451WPB/EWK
         AHzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794099917; x=1794704717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        b=cxJaP07ZBajHbLeCMPXcDYXFnO5H8F5+pbIMXuQjmDk4MeSaZuEfJZV2ZzPCYfppFw
         FZmXHs62vcgJUwu66Yhlb5+DcBn+XldQntiwD+SlxaW6JDQb570Dtf9ZazqKYcj8kQ9E
         D4g1Jo/sfww07HZ8ExlAkVSO3Eb6cfMZ8s2jDN/WpZRQ2/l2S88L6NBr4Fj8RjiVlIOx
         z02w8Dgp/luWMiCILHa/0/02zWDyuIbk+bqVYBzSSMDRlZRfy1uFWNzPmlzp+a7YNIv/
         O9UABHbWEcVPw7CCwF9V/oCFRlIAW+UGm3vXQnR5CagREcU6OUb7vzcHN9JFsSXsqCH5
         CQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794099917; x=1794704717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        b=pruVbSrKy9F9TxAM9aEkse2JEiR9csJ/NpMd7wXN+nOch3qOatQ/oiqxnEreDULL/u
         /9Y2JmOZ64/cZ37vzUkn5O5QpQDRpNB8f9tN3lvor1bYAO25OJbaeaH4Ueva1tgrGVRv
         jlbxqoQO43MzTeWNjUvgxdt+jLW88oGNJA0+k7XeytmVEAHJt9Ht6jQ50p9p6SRPmOGU
         j3kh1EEDOedV9gcnIHtVONukAYO7IVazlzt7ngl8Zwve6crcRionEXlcgYhlBGB+CMA3
         nfw9dnmTQmYbPSJcTYWA+jk65B5II8IY3WnegCFa++rkBp2L8vZadJx/VnXkcbjQlYpt
         SPng==
X-Gm-Message-State: APuU4Z/zsH+inGobmWEAS8eOgt+cf6DYlQXhHCOfrkvobk7Oc+IIzWjz
	d1KQ+OAD/7s4U2MelxLsOmMJufvkP1G2JE8Br+jUYuowVACojcT+lIAVMdp3YImelKcbeewrrlE
	4Sih2ik8LNu5lDKV1ZEhq333pKfoLVvXBISV8x6Y=
X-Gm-Gg: AYBFou0mXbyoS/HYgZ6DiaEA0eithcoRlmC71ZYErYJfDhvnmBmX1dHv6Ud1+AMTWHS
	iL6J9LxksKgKzGOt8H8WcGacL/PTXcZB0m/uu6sTYO9esW6zeIimzUlbv5ZcpgRKmpdeQv1KSgi
	YxaKqRNuvfmdj2pqCmHjcDPISJN1UBEjUqbFD6nJY4CcC1DOr984x44bpFTatsQb9Az46w+Y1BI
	tYVF1JYAMJWoAMk6wagUbeBZAppTpwPggZE/sUOArdm9fnQagoN9RG1QK/o6k3X6+I2QkrVvaoT
	x28SiC1n2S3P2mmJFtwe36mR2Qskpf4XIcEKdmj7NLADaZEyVZwRhu4QFyL0Yad3kXB3IY9opN5
	Xn5inIgiC8AcKVIY7pTmnZ73lgV/aVFQDxmJWkfchk7509jnSGUQgJjU98A72oEqHO13fjEWdjA
	1JmzhdnQ1VmUV0IhiZ
X-Received: by 2002:a05:6102:914:b0:7cc:25bc:3b30 with SMTP id
 ada2fe7eead31-7d2db10230dmr109887137.21.1794099917401; Sat, 07 Nov 2026
 17:05:17 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-b4-mac80211-tailroom-v1-1-f3cfbab9ef5f@gmail.com> <CAKobHXBw6Vb0UEuViBE+SvwHHSRL0csPgA4DvhJ9Dn4Snk3h1w@mail.gmail.com>
In-Reply-To: <CAKobHXBw6Vb0UEuViBE+SvwHHSRL0csPgA4DvhJ9Dn4Snk3h1w@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Sat, 7 Nov 2026 19:05:05 -0600
X-Gm-Features: AclHuK_6GVQ66_E7UYM3o2g7CODSKxMHnMvYY__--thhVTYDM9E4X1eUTiNTW2w
Message-ID: <CAKobHXBE5b3huEiGOwFbvWmgm90wPxdeDaxRVkU6x1=xosq4Zw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: flush TX for a new key only
 if it needs tailroom
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resent as plain text; the lists dropped the first one.)

Hi Johannes,

I see this is marked Rejected in patchwork, but I didn't find a reply
on the list. Could you tell me what was wrong with it, or what you
would want instead? I'd like to get the underlying problem fixed one
way or another.

The problem, in short: ieee80211_key_link() counts every new key as
needing tailroom before ieee80211_key_replace() uploads it to the
driver, so whenever crypto_tx_tailroom_needed_cnt goes from 0 to 1 the
key install waits in synchronize_net(). On an AP whose driver holds no
other software key (no PMF, so no software BIP key keeping the count
up), that is every pairwise key install at the end of a 4-way
handshake: 30-65 ms at HZ=100, with hostapd blocked and serving no one
meanwhile. We measured it on ath11k, ath10k and mt76 APs; with the
patch the same installs took 0-2 ms.

If the problem is the ordering (the count now goes up only after the
upload, or only if the upload left the key in software), I can rework
it. If it's the approach as a whole, a pointer to the direction you'd
prefer would help.

Thanks,
Christopher Griffin <christophergriffin05@gmail.com>
