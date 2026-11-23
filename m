Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429707;
	b=DOeWEHJxhuUaU+htZEqwHWy7pPUeR84Cw3JKlBbx6k0J0l9f3Hi+KfwwEXrBi3HN9HC3
	 YoGwkUN/IDdehhNnkrrhwU0chz+bBsGW26AcxzcqK50z/vt3vNF1YqZm2a9U6HWmxhsu+
	 1qlBbSqZsRcCMCrgKEpLda5pqH57BshZ3yzAFpWE/PDdcTW4pCexUceEQhi9+9/OTSlgt
	 8jsjTbWMLlLr9KPsWqf3VJP3HpRgqcyLoBqfMw8diScnn1TTm3nOmDZM5kkwsnLQu6G1X
	 m3MFMiIZ8XPCt+o0tkp42hwXjDegloO8/tAFZd6ZdAUse9zjkBIgUYCzjhO+ZTeMG2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429707;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=aeKw/J26hi2DKZFvEjSv0cLHoXYPF29pHxkKYbPDdaY=;
	b=q3xqKF4oFgL74DvuMPhuQxwtF0O5JhHWVdO6SPukyz6PRbS9Uwx/7xOYHLIoltqPJEoM
	 kMbBRXNAAzVNCa4QbwtfD922UgIOPXu59L4dlsLrrkUW7OCq1BSsPwEbSYAispdWUM7kx
	 9iE0J41ONa77wistMNLduNSClm7D8ihmsUNjerqVHBI5TyaWDAM9pl9YO+x/C18UQoHjS
	 1WTDNyyB357SSN2MKXaTiLWtoLyGSOXPiIQghSQC4bItWqEMN4q6fDwUpsHOB92X4eqKN
	 25IoHXCpl9D1J/p9VEDwAoSrie6DeS7VqEdDBhIouoDoIUsaH/RPHxCsBdQR2lu52Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7279606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7279606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000C37;
    23 Nov 2026 13:28:28 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:28:11 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000C36;
   23 Nov 2026 13:28:10 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000CE7;
  23 Nov 2026 13:28:04 +0300
Received: from spooler by mail-s22.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:28:01 +0300
Received: from ehlo.thunderbird.net (128.204.79.23) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000CE6;
   23 Nov 2026 13:27:59 +0300
Date: Mon, 23 Nov 2026 13:28:02 +0300
From: RFAREAS Support <support@rfareas.com>
To: wens@kernel.org, Chen-Yu Tsai <wens@kernel.org>
CC: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Belarus (BY)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAGb2v64WJg8hR8eoqqbV=n-0qPVE5ARBG3mKU3+sR4nDmp_btw@mail.gmail.com>
References: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com> <CAGb2v64WJg8hR8eoqqbV=n-0qPVE5ARBG3mKU3+sR4nDmp_btw@mail.gmail.com>
Message-ID: <DDC0D3B5-F31E-47E3-B556-FA1AAB5EB023@rfareas.com>
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

> Assuming the DFS requirement comes from ITU-R Resolution 229 /
> ETSI EN 301 893, then the TPC requirement also applies, and since
> Linux does not support TPC, the -3 dBm reduction should be applied
> for 5250-5350 MHz=2E
>
> Could you check?

Checked: the Belarus table of frequency allocations (Council of
Ministers Resolution No=2E 620 of 9 August 2016) has footnote 5=2E446A,
which refers to ITU-R Resolution 229 for 5150-5350 MHz and 5470-5725
MHz=2E v2 sets 5250-5350 MHz to 100 mW=2E 5650-5725 MHz stays at 200 mW,
which is already below the Resolution 229 limit without TPC=2E

  [PATCH v2] wireless-regdb: Update regulatory info for Belarus (BY)

Thanks,
Valery


--=20
RFAREAS Support
