Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505085;
	b=xmFxnAnSmHryeAJMeTVXxsUDTJiiqCFzrmmSLrj6MUeYkxMNKMsIdPVrq3i02wMBv3wj
	 UJTNZZoosXgjCHsMiyYz+McRDPn5zn64rkAoe+yuoztmRmoa6YqtFp0z6BbYH2GBuMF5y
	 YUcUmCPNNPOXSs9J0/wf4e+TrzPCW/+A8KTBOAThYNGYObWEcCkLUaCpiUR68X33MLANr
	 re4ZwAhJRBnO/QDMck0grXmeKGSq4aO5fmWqfPEoiCv4UbJ9HaKWkXkyHcStwYtyq5I7A
	 i4qlLAV1lHUK4Lisvy4pMZDLbV4hZB0INutrGsnHIgLV+E7R8OLGlE3woqfpmA0Cd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505085;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=lu3TBw/WM/urq3xDHmNn1XSEBmwlI+PkHSfcimE0uNI=;
	b=k0ub6zY8okQndXwUGnsMs/zgbqpVbk3/j+LFA5HPcC9nBJCYSWKNv6gAZVidq+NDPmFM
	 +e1pXY0d2WloQXst1Nja9h69YHRrVmFHFp20X1Z1MPgSabExmvcq0ykzqi9N/iw4C9log
	 3nR+FISbpVO+2LkBPTcDZTbxEamixo2/+jTMSO72P/0quBRRN9M8aSbLtXLvhqA+yPqyG
	 RWaf1gcDKoFhB+P6JnSLHlLNxE7/Dcb1N0Tv2Nh5KktAeRIZYMuUK2igA0hFyrkVuSshb
	 SlwGeQzXOIQK2KVb4NsurgHOFL1aMBSe9eIJn9ckwj1fm1+HVCak12Sk6dn/WDlUDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5257A606A326
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5257A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO0006A0;
    24 Nov 2026 10:24:44 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:24:27 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00069F;
   24 Nov 2026 10:24:27 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000516;
  24 Nov 2026 10:24:05 +0300
Received: from spooler by mail-s22-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:24:02 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000515;
   24 Nov 2026 10:24:00 +0300
Date: Tue, 24 Nov 2026 10:24:21 +0300
From: RFAREAS Support <support@rfareas.com>
To: wens@kernel.org, Chen-Yu Tsai <wens@kernel.org>
CC: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Subject: Re: [PATCH] wireless-regdb: Update 60 GHz rule for Ukraine (UA)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAGb2v64HFxk90gUKbtf-MbZX1dhYrpH5RT_JCWRzpUxOwpnxnQ@mail.gmail.com>
References: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com> <CAGb2v64HFxk90gUKbtf-MbZX1dhYrpH5RT_JCWRzpUxOwpnxnQ@mail.gmail.com>
Message-ID: <C1FBB771-40F4-40A9-AECF-7D1F45088C36@rfareas.com>
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

> I couldn't open this one, but my LLM agent says it matches=2E

In case zakon=2Erada=2Egov=2Eua does not open from your side, the regulato=
r
publishes the original text of the list as well:
https://nkek=2Egov=2Eua/static-objects/nkek-october-prod/sites/1/%D0%A0%D0=
%9E%20%D1%82%D0%B0%20%D0%92%D0%9F/dodatok-do-postanovy-361-03072024=2Epdf
Item 78 is not changed by the later amendments=2E

> It also noticed that the 2=2E4 GHz indoor-only restriction was removed=
=2E
> Could you check? If that is true, please send a follow-up patch if you
> can=2E

Confirmed=2E Item 53 allows 2=2E4 GHz Wi-Fi access points "inside and
outside premises", with the antenna at most 6 m above ground, and
item 52 (RLAN terminals) has no indoor-only condition=2E Follow-up sent:

  [PATCH] wireless-regdb: Allow outdoor use of 2=2E4 GHz for Ukraine (UA)

Thanks,
Valery


--=20
RFAREAS Support
