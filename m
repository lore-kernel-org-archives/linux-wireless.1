Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876328;
	b=r5AV/SOMPQFWlvBozgalcXtznFGWb91/Q+PZkcgBkMFa+0l9ux5+/IspAbyYXaw0Ap6f
	 hIZLIz+TgoaL8PlYRoiRNQrL0kuwYzhsqCiJ/EuF+AqLxRZVzyzXsKUQxxirYm1LUCfhM
	 NZnuJmtoHtHNFPzmXqtv1WF/rH/2S+2rl4Ndxa8viWEvXCuFyJ4sPrdMqpYzHgU4HmRZI
	 YPHj5S1MsjZtcglP20itDsmkpLT8H6os8ajVgpiZ3krTxb7b++j4kf/u2nQRG+NREURwo
	 Q+BiHTtTmVNRqMEZUQ9ibRO6wWzKhiTqcYpUfPs79xZgesaT7W4rmGxNsRqpDywiXNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876328;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rTTwFA/0eGYGbHVcOKbWB42W/COa7oa6wqgZD1+tTvc=;
	b=oDF4zaX0tbgyOHYj939J/0C90aQ0oisKj3nVOo4VJNKeTY3B0GH6fhIoOtzbAkDIkkmH
	 KXPIk6TmzzL8OUxcuoU/aPjA5iPpz35rT5M+Dy19vFviPsZjZ34jFvtVqd03nGlkA17RE
	 H7dFADw6n9pR+qo+ZJQqUb/rcFk3OTx/4UMDvyx5/Dy0jr+WoOeveJIqhO1JuE5rK5bVB
	 Ej/RYJuSJSyKvVrWnrWbxvhR3inwflvOfEFCTTA7f1b4hP4cz0WJ+ek9ZZaJZNzOFLMqH
	 bTXlfZ+njXhhc3A4/UoIh8G3jeRdTXr+8qmv4zWqKFtBdFNv6YUqkrQbG2gMvSxjy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ufI5DqE3;
	arc=none smtp.remote-ip=109.224.244.25
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF4606A324
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 14:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AF4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ufI5DqE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795876325; x=1796135525;
	bh=rTTwFA/0eGYGbHVcOKbWB42W/COa7oa6wqgZD1+tTvc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ufI5DqE3kn2HJhVnK6/iu43h7Z42bdans3tPefMrmy6d9IhqzNNPCwSl2n7r78b0z
	 YuCva6Uj84zrgXZuG69DFPJDcY5FHLpfVB0FuQ8x8Bsihnba0PZoMhGnWzo0ZpH5Eo
	 8gw65K5aInugeWaTQcmkKszbci3tG2/tFFwcaugTAIzKN1qEHUSWpD0OHdqUx542Ck
	 gikSbnxhzQdMffJ3i5l8lm9JOOs7+tkPp+OhrvNSlI4bqiFUuEDKXV4TxsanZu1EYt
	 pXDzjaGgyFh8xkg5CMG9R9qOKmiF3r2513/+GK5GXe/Sk9oCjjQf9nGmUi13/0vpYB
	 gWPT5HNI8XQUQ==
Date: Sat, 28 Nov 2026 14:31:59 +0000
To: Luka Gejak <luka.gejak@linux.dev>
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: mac80211: don't mark NO_ACK frames as failed in TX status radiotap
Message-ID: <R3Cf8qvLiaJxuKOOCwLhrkUhR16U_YqjkAt1KsZDuOSeGlpkbzdBaBupAy3sGkCpkOcKkREDewDeEMa6UiA1mT3ff1BZBjJf-t9V34Izfrk=@proton.me>
In-Reply-To: <414C2697-5365-49ED-A766-98BEBEE37E76@linux.dev>
References: <20261127-b4-mac80211-noack-v1-1-c7e6f7c56d3c@proton.me> <414C2697-5365-49ED-A766-98BEBEE37E76@linux.dev>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: b1232c4a01af323798a6a2b037a20dc76be6d4e4
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luka,

Thanks for the review.

> Enver's v2 stops setting the bit for those drops in both paths, so we
> should probably wait for it to get merged before merging this patch.

Agreed. Johannes, if you take this, it would be best after Enver's
rtw89 fixes, so that frames rtw89 dropped don't show up as sent:
https://lore.kernel.org/r/20261127101307.15-1-owner@ph4ntom-rev.uz/

Thanks,
Ahmet



Sent with Proton Mail secure email.
