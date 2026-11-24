Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504982;
	b=r8X8hSvowTc0ts/alQ3gXTT9eEgSHq+wHtZwhZdWAMoi7QuPX9HAzViadplx5sL6xPiP
	 EBTh/m1I8FwOLaX3VVMNK3zNg6MDiW44rbGhTxWpAqnOXrUbZjVkeSELxs5qvdZali7Px
	 d1mULJObHnIxQyhctoHhdS9tDfDS7N1O4jUJ9GG8eHfqLvxNAv3naHMNko9u3VoW2uL4y
	 BaPgcFN31nm28kRVH6nA1UeMyES055Uvl60VHDpssFQLOC0cRsAMleRKiiim2naVZtuD1
	 V5jaJP/B1uwW17sO0SBliCn75EnElHGd/aFc5hUp2xQoNubtDSGkVMF4DYfg0WztNmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504982;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=/dQV/fbTrB6M7VQXosGvuiS9KcVJ3sBqBH9R6c1fAPU=;
	b=QlqQU47I5KpKEr+EVqpvzjtObsuVaPB7gUt8/YQKfZZdZl722QortzY366yqIrs8u2S3
	 kAr/rN0cYBqUID/BzsHZvuW+erNyJwM5ov7Y6BPoFI/lYgZiKpmtrol+5VqHWSTpAD+aj
	 RyEpio3lAqRyeLoE7lyGog+6HpQaNhJ7c/mYHFpzzY1jkfi4eRgsA8uZQF/dR492s70q/
	 /5ZhbzZZJ1WbdteUQvQeEsI9dkRq2tGvQ9GmDTfmEXFHnh1FigHKj4dBOtOsDoR7t+rHi
	 U+bLwGwaM5CSToyDfR/PPlvIr8ihj3GdnnuIxuU3oWiIAepQ4W0ZnR/xzC4plG4j1Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39208606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39208606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO00068C;
    24 Nov 2026 10:23:02 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:22:54 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00068B;
   24 Nov 2026 10:22:54 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO00050B;
  24 Nov 2026 10:22:35 +0300
Received: from spooler by mail-s22-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:22:33 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00050A;
   24 Nov 2026 10:22:32 +0300
Date: Tue, 24 Nov 2026 10:22:51 +0300
From: RFAREAS Support <support@rfareas.com>
To: wens@kernel.org, Chen-Yu Tsai <wens@kernel.org>
CC: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Georgia (GE)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAGb2v67-2yV6oUA--fnG=ndHrOy4Li7pdZrNf954AwSm_Xk+dw@mail.gmail.com>
References: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com> <CAGb2v67-2yV6oUA--fnG=ndHrOy4Li7pdZrNf954AwSm_Xk+dw@mail.gmail.com>
Message-ID: <D643437D-913A-4F1E-8783-8AB4872BC171@rfareas.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CC-Diagnostic: Header RECEIVED matches "*([0-9]+.[0-9]+.[0-9]+.[0-9]+)*" (0)

> There is also a non-specific SRD entry for this range limited at 25mW=2E
> Would that be usable? If so, please send a follow-up patch=2E

Yes=2E Table 1 of the same Annex (non-specific short range devices) has
5725-5875 MHz at 25 mW e=2Ei=2Er=2Ep=2E under EN 300 440, with no duty cyc=
le or
other condition=2E Follow-up sent:

  [PATCH] wireless-regdb: Allow 5725-5875 MHz short range devices for Geor=
gia (GE)

Thanks,
Valery


--=20
RFAREAS Support
