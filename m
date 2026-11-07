Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052128;
	b=u3gbtgVpHCUnavo3VECb2AqtEueAshg4Og9i6n9X8RB22L43azn2X+t3y+9GOEtwhbFe
	 RNee1bsy0+aDM9kqM1BUZDTH1ns/HdaOBBCEpZtp3nZA5rGEOuq7jI0d/4ycQQF7IERew
	 pr7wIvy7d1HABpytMAES9Mfkg+KSQbvXL95dp2REYysxdRpr3q5JpaRvNMNwWlkQ2shbC
	 Q56fzMZbxrwIwFHWttqHjIQJjw2LOaNh2kjCtLtWKKnM+dYS7V6/C7/NaWPzNqeySTeDh
	 9+riokkrGOCfjs+7My4Owl62oM4Nnno8uePyFV0pXPEqyW0oEWTnr/Pj6JqdZgVyYlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052128;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=JWSJEriJFCnFeVzhFsdRbGGSMSYCHXuGyi+hBWEoAYk=;
	b=M2LOxlEeiQS/tAHAMuBLM4CQlTKzDySiOPb393aEU7gOQEmJUo1xQZWkeIhNuGsayJso
	 A12/ibcLAVgmnZ5qnCVNEiPZDqc3e6olBQFARZ9rs7pPZHHdHC5SSZI0/qifcEtQpSwjo
	 Z9gWRo1uJJnZPLF//k9ZeDZtLnFdrJwfaqBPqpn4P49/75eCUS+rrysHCYcCeVw2cJSni
	 324wjWpzFVgQ6cVHPDqSgvHx8yH2NhXLNqM6vLr7Ce0LMOfIvK56ITIehALJ29rXdT6HN
	 QG5kjpI9xeZUN+/RTzEg62nwLkT4TSm5vWGZfyVewnmKnG/Rwne5iSh5GfjbuC28fMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=YLwZGhto;
	arc=none smtp.remote-ip=62.149.156.132
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5FF606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 11:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=YLwZGhto
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id PeuSx0XYHV5J9PeuTxroJ5; Sat, 07 Nov 2026 12:48:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794052117; bh=hszukWnGhhh6opqByDn4MIdnuQ9jnNsyXnL56pWZ5Cs=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=YLwZGhto9OGzDDqhXrh9iVcImpXDZtlwF8oNH8MZsZDAV3VdyqKCOhf+Atmyy+ZyR
	 T44PP8wBhuqvnoH5cJzlKk+kPj9jNC6bftdMlHHPBM/Ew73RbuUV1UuQ7Wzonbuh1c
	 HxMOCUjEZDqsW4iHyQkMQ0AvoyYZJAYVDuMTxwECCDLt6TYptpeuAlb7Kz4NyVjZyM
	 QgQYj2aMV0h3Cam2w8PDtA+T4W/p4otYQKMyOBX505nqn6KlIDm4beQbD3lM3EACiq
	 LMYi5mJFPQh6cAE3UE/lNsb6fPs/vnxx2hU5NDkCbcQZgQeM/MblVqay0vLVa2Tqj0
	 omRRZssXFkxhw==
Date: Sat, 7 Nov 2026 12:48:34 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Luca Casati <luk00casati@gmail.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net,
 arend.vanspriel@broadcom.com, b43-dev@lists.infradead.org
Subject: Re: [PATCH wireless-next v2 0/5] b43: N-PHY: fix calibrations on
 rev7+ (BCM43228)
Message-ID: <20261107124834.00003e91@mythread.it>
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOKLfoyXNtJDuETR/nU1jvZUK6HjTvwiHDX0K3CWMD+YmzOWXWqFkbuPoJLHR9/YLN0OEzDyg1n6ZsiOFveAymtHLa4oWQKH8D583MdbZ9pAXc8YhvwB
 +AmdBcaPeiM8Sx8vyrWMQ8Sl28DkKbUDF4J1XXaAU4DThzuTACE8zJ1o4+Fcn13DQP1ZwSo2G8FdLNmUDq0pFde6AK+Y/rsgzqrCMOGo+ES/QgppybkQHQ+N
 x+PJRWkzUe9S7giQv1cmgCQ3eH2vyXyIGIECDgVA+5i6ftkVM7+Rt6xYyOj3zWwIdrKD/bQ3v5xtwHOkbBgB+Regq9HCCZFqvg5Dnz0GS+3e67WFs8vGbm0r
 kMJfeqct

Il giorno Fri,  6 Nov 2026 22:15:11 +0100
Luca Casati <luk00casati@gmail.com> ha scritto:

> On a BCM43228 (14e4:4359, N-PHY rev 16, radio 2057 rev 9) b43
> associates but transmits poorly: high retry counts and low rates.
> Comparing mmiotraces of b43 and the proprietary wl driver
> (6.30.223.271) on the same card, together with brcmsmac, turned up
> several bugs in the N-PHY calibration code:
> 
>  1. The TX tone sample table was loaded as all zeros, so every
>     tone-based calibration ran without a signal.
>  2. TX IQ/LO calibration: inverted busy poll, reversed final copy,
>     and missing rev7+ cleanup that left TX dead after a cal.
>  3. RSSI calibration: wrong VCM written on rev7+, wrong distance
>     formula, wrong rounding of negative offsets.
>  4. 2057 RC calibration: every delay was about twice wl's, so the
>     first run was stopped while it was running and SCAP read 0
>     instead of 8, detuning the TX low-pass filter.
>  5. A missing field in the rev7 TX_PU RF override.
> 
> The traces, and excerpts of the operations behind each patch next to
> the same operations from b43, are at:
> 
>   https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/README.md
> 
> Each changelog links its excerpts.
> 
> Patches 4 and 5 and the cleanup parts of patch 2 only affect rev7+.
> Patch 1, the poll and final-copy fixes in patch 2, and the
> distance/rounding fixes in patch 3 also change code that runs on older
> N-PHYs (rev3+); I could only test rev 16, so testing on other N-PHY
> cards would be welcome.
> 
> Tested on the BCM43228 only (2.4 GHz, 11g/HT20), on v7.0; the series
> also applies to wireless-next. With v1, throughput to the internet
> went from about 5.7/4.1 to 11.1/5.2 Mbit/s down/up, with fewer TX
> retries. That number is limited by the line and noisy, so take it as
> a rough indication; wl reaches 21-32 Mbit/s down on the same setup,
> so there is more to do (PAPD and TX power control on rev7+).
> 
> Changelogs refer to wl where the fix was checked against its register
> writes. If citing the proprietary driver is not acceptable here, I am
> happy to reword them.
> 
> The bugs were found and the fixes drafted with the help of an AI
> coding assistant (Claude Opus 5.5), working from the mmiotrace diffs
> between b43 and wl and from brcmsmac. I reviewed and tested every
> patch on the hardware above.
> 
> Changes in v2:
> - Dropped the comments the patches added.
> - Patch 2: the changelog said the coefficients match wl's; they are
>   close, not equal.
> - Patch 4: replaced. v1 waited for the first RC cal run and explained
>   it wrongly: wl stops that run right away too, just sooner. v2 uses
>   wl's delays throughout the cal instead.
> - Linked the mmiotrace excerpts from each changelog.
> 
> Luca Casati (5):
>   b43: N-PHY: fix the TX tone sample table
>   b43: N-PHY: fix TX IQ/LO calibration
>   b43: N-PHY: fix rev3+ RSSI calibration
>   b43: N-PHY: use wl's delays in the 2057 RC calibration
>   b43: N-PHY: add the missing override to the rev7 TX_PU command
> 
>  drivers/net/wireless/broadcom/b43/phy_n.c | 115
> +++++++++++++++++----- 1 file changed, 90 insertions(+), 25
> deletions(-)
> 
> 
> base-commit: 028ef9c96e96197026887c0f092424679298aae8

You didn't use check the maintainers right? Because you keep including
Arend...
