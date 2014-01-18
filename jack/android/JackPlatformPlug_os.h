/*
 Copyright (C) 2004-2008 Grame
 Copyright (C) 2013 Samsung Electronics

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation; either version 2.1 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

 */

#ifndef __JackPlatformPlug_android__
#define __JackPlatformPlug_android__

#define jack_server_dir "/data/misc/jack"
#define jack_client_dir "/data/misc/jack"
#define JACK_DEFAULT_DRIVER "alsa"

namespace Jack
{
    struct JackRequest;
    struct JackResult;

    class JackPosixMutex;
    class JackAndroidThread;
    class JackFifo;
    class JackSocketServerChannel;
    class JackSocketClientChannel;
    class JackSocketServerNotifyChannel;
    class JackSocketNotifyChannel;
    class JackClientSocket;
    class JackNetUnixSocket;
}

/* __JackPlatformMutex__ */
#include "JackPosixMutex.h"
namespace Jack {typedef JackPosixMutex JackMutex; }

/* __JackPlatformThread__ */
#include "JackAndroidThread.h"
namespace Jack { typedef JackAndroidThread JackThread; }

/* __JackPlatformSynchro__  client activation */
/*
#include "JackFifo.h"
namespace Jack { typedef JackFifo JackSynchro; }
*/

#include "JackAndroidSemaphore.h"
namespace Jack { typedef JackAndroidSemaphore JackSynchro; }

/* __JackPlatformChannelTransaction__ */
/*
#include "JackSocket.h"
namespace Jack { typedef JackClientSocket JackChannelTransaction; }
*/

/* __JackPlatformProcessSync__ */
#include "JackPosixProcessSync.h"
namespace Jack { typedef JackPosixProcessSync JackProcessSync; }

/* __JackPlatformServerChannel__ */
#include "JackSocketServerChannel.h"
namespace Jack { typedef JackSocketServerChannel JackServerChannel; }

/* __JackPlatformClientChannel__ */
#include "JackSocketClientChannel.h"
namespace Jack { typedef JackSocketClientChannel JackClientChannel; }

/* __JackPlatformServerNotifyChannel__ */
#include "JackSocketServerNotifyChannel.h"
namespace Jack { typedef JackSocketServerNotifyChannel JackServerNotifyChannel; }

/* __JackPlatformNotifyChannel__ */
#include "JackSocketNotifyChannel.h"
namespace Jack { typedef JackSocketNotifyChannel JackNotifyChannel; }

/* __JackPlatformNetSocket__ */
#include "JackNetUnixSocket.h"
namespace Jack { typedef JackNetUnixSocket JackNetSocket; }

#endif
